import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RequestState extends Equatable {
  final bool loading;
  final bool created;

  RequestState({this.loading = false, this.created = false})
      : super([loading, created]);

  factory RequestState.initial() {
    return RequestState();
  }

  RequestState copyWith({bool loading, bool created}) {
    return RequestState(
      loading: loading == null ? this.loading : loading,
      created: created == null ? this.created : created,
    );
  }
}
