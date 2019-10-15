import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class DetailProductState extends Equatable {
  final bool loading;
  final List list;
  final String keySearch;

  DetailProductState({this.loading = false, this.list = const [], this.keySearch = ''})
      : super([loading, list, keySearch]);

  factory DetailProductState.initial() {
    return DetailProductState();
  }

  DetailProductState copyWith({bool loading, List list, String keySearch}) {
    return DetailProductState(
        list: list ?? this.list,
        keySearch: keySearch ?? this.keySearch,
        loading: loading == null ? this.loading : loading);
  }
}
