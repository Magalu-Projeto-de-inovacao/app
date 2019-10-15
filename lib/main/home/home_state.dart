import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final bool loading;
  final List list;
  final String keySearch;

  HomeState({this.loading = false, this.list = const [], this.keySearch = ''})
      : super([loading, list, keySearch]);

  factory HomeState.initial() {
    return HomeState();
  }

  HomeState copyWith({bool loading, List list, String keySearch}) {
    return HomeState(
        list: list ?? this.list,
        keySearch: keySearch ?? this.keySearch,
        loading: loading == null ? this.loading : loading);
  }
}
