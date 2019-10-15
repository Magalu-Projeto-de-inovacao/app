import 'package:app_desafio_inovacao/core/api/api.dart';
import 'package:app_desafio_inovacao/core/api/api_response.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/models/person_model.dart';
import 'package:app_desafio_inovacao/models/product_model.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class ProductsRepository {
  ApiService api;

  ProductsRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  read({String query = ''}) async {
    ApiResponse response =
    await api.request(method: Method.get, path: '/products?q=$query');

    if (response.statusCode == 200)
      return List<Product>.from(
          response.body['content'].map((item) => Product.fromJSON(item)).toList());

    print(response.body);

    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

}
