import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DetailProductEvent extends Equatable {
  DetailProductEvent([List props = const []]) : super(props);
}

class Report extends DetailProductEvent {
  final String idDataSheet;
  final String product;

  Report({@required this.idDataSheet, @required this.product});
}
