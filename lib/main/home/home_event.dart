import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class Search extends HomeEvent {
  final String query;

  Search({this.query});
}
