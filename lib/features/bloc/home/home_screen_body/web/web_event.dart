import 'package:equatable/equatable.dart';

class WebEvent extends Equatable{
  const WebEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WebSearchEvent extends WebEvent{
  final String? endPoint;
  final String? query;
  final String? country;

  const WebSearchEvent(this.endPoint,  this.query, this.country);

  @override
  List<Object?> get props => [endPoint,query,country];
}