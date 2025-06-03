// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class HiveStorageServices {
  /// singleton implementation
  static final HiveStorageServices _instance = HiveStorageServices._internal();

  /// private constructor for singleton pattern
  HiveStorageServices._internal();

  /// factory constructor that returns the singleton pattern
  factory HiveStorageServices() => _instance;

  /// Cache to track box opening futures to prevent concurrent open operations
  final Map<String, Future<Box>> _boxCache = {};

  /// Initialize Hive for Flutter
  static Future<void> initialize() async {
    try {
      await Hive.initFlutter();

      /// Register adapters here if needed
      /// Hive.registerAdapter(UserAdapter());
      if (kDebugMode) {
        debugPrint("\n ===> Hive initialized successfully");
      }
    } catch (e) {
      debugPrint("\n ===> Hive initialized successfully");
    }
  }

  /// Thread-safe method to open a Hive box using a cache
  Future<Box> _openBox(String boxName) {
    return _boxCache.putIfAbsent(boxName, () async {
      try {
        if (Hive.isBoxOpen(boxName)) {
          return Hive.box(boxName);
        }
        return await Hive.openBox(boxName);
      } catch (e) {
        /// Remove failed attempt from cache so future attempts can try again
        _boxCache.remove(boxName);
        debugPrint("Error opening box $boxName : $e");
        rethrow; //Rethrow as this is a critical error
      }
    });
  }

  /// Save data to a box
  Future<void> saveData<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    try {
      final box = await _openBox(boxName);
      await box.put(key, value);
    } catch (e) {
      debugPrint("Error saving data to $boxName with key $key : $e");
      rethrow;
    }
  }

  /// Read data from a box
  Future<T?> getData<T>({
    required String boxName,
    required String key,
    T? defaultValue,
  }) async {
    try {
      final box = await _openBox(boxName);
      return box.get(key, defaultValue: defaultValue) as T?;
    } catch (e) {
      debugPrint('\n====> Error reading data from $boxName with key $key: $e');
      return defaultValue;
    }
  }

  /// Check if a key exists in box
  Future<bool> containsKey({
    required String boxName,
    required String key,
  }) async {
    try {
      final box = await _openBox(boxName);
      return box.containsKey(key);
    } catch (e) {
      debugPrint("\n====> Error checking $key in $boxName: $e");
      return false;
    }
  }

  /// Delete data for a specific key
  Future<void> deleteData({
    required String boxName,
    required String key,
  }) async {
    try {
      final box = await _openBox(boxName);
      await box.delete(key);
      debugPrint("\n====> $key in box $boxName deleted successfully");
    } catch (e) {
      debugPrint("\n====> Error deleting key $key in $boxName: $e");
      rethrow;
    }
  }

  /// Clear all data in a box
  Future<void> clearBox({required String boxName}) async {
    try {
      final box = await _openBox(boxName);
      await box.clear();
      debugPrint("\n====> box $boxName cleared successfully");
    } catch (e) {
      debugPrint("\n====> Error clearing data from box $boxName: $e");
      rethrow;
    }
  }

  /// Delete a box from disk
  Future<void> deleteBox({required String boxName}) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.close();
      }
      // clean up cache
      _boxCache.remove(boxName);

      // delete from disk
      await _boxCache.remove(boxName);
      debugPrint("\n====> box $boxName deleted successfully");
    } catch (e) {
      debugPrint("\n====> Error deleting box $boxName: $e");
      rethrow;
    }
  }

  /// Get all keys in a box
  Future<List<dynamic>> getAllKeys({required String boxName}) async {
    try{
      final box = await _openBox(boxName);
      debugPrint("All keys in box $boxName: ${box.keys.toList()}");
      return box.keys.toList();
    } catch(e){
      debugPrint('Error getting keys from $boxName: $e');
      return [];
    }
  }

  /// Get all Values in a box
  Future<List<T>> getAllValues<T>({required String boxName})async{
    try{
      final box = await _openBox(boxName);
      debugPrint("All values in box $boxName: ${box.keys.toList()}");
      return box.values.cast<T>().toList();
    }catch(e){
      debugPrint('Error getting values from $boxName: $e');
      return [];
    }
  }

  /// Watch changes to a specific key
  Stream<BoxEvent> watch(String boxName, {String? key}) async* {
    try {
      final box = await _openBox(boxName);
      yield* box.watch(key: key);
    } catch (e) {
      debugPrint('Error watching $boxName with key $key: $e');
      yield* Stream.empty();
    }
  }


  /// Close all open boxes
  Future<void> closeAllBoxes() async {
    try {
      await Hive.close();
      _boxCache.clear();
    } catch (e) {
      debugPrint('Error closing all boxes: $e');
      rethrow;
    }
  }
}


