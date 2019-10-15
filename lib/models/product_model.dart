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

  Product(this.id, this.name, this.brand, this.price, this.description,
      this.images);

  static fromJSON(json) {
    return new Product(json['_id'], json['name'], json['brand'],
        json['price'].toDouble(), json['description'], json['images']);
  }
}
