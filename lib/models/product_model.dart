import 'package:app_desafio_inovacao/models/datasheet_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Product extends Equatable implements Object {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String description;
  final List images;
  final List<DataSheet> dataSheet;

  Product(this.id, this.name, this.brand, this.price, this.description,
      this.images, this.dataSheet);

  static fromJSON(json) {
    final List dataSheetMap = json['dataSheet'];
    final dataSheet = dataSheetMap
        .map<DataSheet>((item) => DataSheet.fromJSON(item))
        .toList();
    final product = new Product(
        json['_id'],
        json['name'],
        json['brand'],
        json['price'].toDouble(),
        json['description'],
        json['images'],
        dataSheet);
    return product;
  }
}
