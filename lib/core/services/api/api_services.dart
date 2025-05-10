







import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A service class for handling HTTP requests using Dio with token injection for authentication.
class ApiServices {
  final Dio _dio;
  final Future<String?> Function() getTokenSomehow;
  static const int _defaultTimeout = 10; // seconds

  /// Constructor to initialize Dio with a base URL, optional custom options, and token retrieval function.
  ApiServices({
    required String baseUrl,
    required this.getTokenSomehow,
    BaseOptions? baseOptions,
  }) : _dio = Dio(
    baseOptions ??
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: Duration(seconds: _defaultTimeout),
          receiveTimeout: Duration(seconds: _defaultTimeout),
          headers: {"Accept": "application/json"},
        ),
  ) {
    // Add interceptors for logging, token injection, and error handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Inject Authorization header with Bearer token if available
          final token = await getTokenSomehow();
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          if (kDebugMode) {
            debugPrint('Request: ${options.method} ${options.uri}');
            debugPrint('Headers: ${options.headers}');
            if (options.data != null) {
              debugPrint('Body: ${options.data}');
            }
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            debugPrint('Response: ${response.statusCode} ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (kDebugMode) {
            debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
          }
          return handler.next(e);
        },
      ),
    );
  }

  /// Performs a generic HTTP request.
  Future<T> _request<T>({
    required String method,
    required String endPoint,
    Map<String, dynamic>? queryParams,
    dynamic body,
    T Function(Response)? responseParser,
  }) async {
    try {
      final response = await _dio.request(
        endPoint,
        options: Options(method: method),
        queryParameters: queryParams,
        data: body,
      );

      // Check status code and handle accordingly
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return responseParser != null ? responseParser(response) : response.data as T;
      } else {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Unexpected status code: ${response.statusCode}',
          response: response,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Performs a GET request.
  ///
  /// [endPoint]: The API endpoint (e.g., '/users
  ///  ').
  /// [queryParams]: Optional query parameters.
  /// [responseParser]: Optional function to parse the response into a specific type.
  /// Returns the parsed response or raw data.
  Future<T> getApiCall<T>({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    T Function(Response)? responseParser,
  }) async {
    return _request(
      method: 'GET',
      endPoint: endPoint,
      queryParams: queryParams,
      responseParser: responseParser,
    );
  }

  /// Performs a POST request.
  ///
  /// [endPoint]: The API endpoint (e.g., '/users').
  /// [body]: The request body.
  /// [responseParser]: Optional function to parse the response into a specific type.
  /// Returns the parsed response or raw data.
  Future<T> postApiCall<T>({
    required String endPoint,
    required Map<String, dynamic> body,
    T Function(Response)? responseParser,
  }) async {
    return _request(
      method: 'POST',
      endPoint: endPoint,
      body: body,
      responseParser: responseParser,
    );
  }

  /// Handles Dio errors and converts them to custom exceptions.
  ApiException _handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = error.message ?? 'Unknown error';
    final responseData = error.response?.data;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          statusCode: statusCode,
          message: 'Request timed out',
          response: error.response,
        );
      case DioExceptionType.badResponse:
        return ApiException(
          statusCode: statusCode,
          message: responseData is Map ? responseData['message'] ?? 'Server error' : 'Server error',
          response: error.response,
        );
      case DioExceptionType.cancel:
        return ApiException(
          statusCode: statusCode,
          message: 'Request was cancelled',
          response: error.response,
        );
      default:
        return ApiException(
          statusCode: statusCode,
          message: message,
          response: error.response,
        );
    }
  }
}

/// Custom exception for API errors.
class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final Response? response;

  ApiException({
    this.statusCode,
    required this.message,
    this.response,
  });

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}
