import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RequestEvent extends Equatable {
  RequestEvent([List props = const []]) : super(props);
}

class Create extends RequestEvent {
  final String attribute;
  final String value;
  final String reason;
  final String products;

  Create({
    @required this.attribute,
    @required this.value,
    @required this.reason,
    @required this.products,
  });
}
