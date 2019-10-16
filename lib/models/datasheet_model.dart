import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class DataSheet extends Equatable implements Object {
  final String id;
  final String attribute;
  final String value;

  DataSheet(this.id, this.attribute, this.value);

  static fromJSON(json) {
    return new DataSheet(json['_id'], json['attribute'], json['value']);
  }
}
