import 'package:app_desafio_inovacao/core/api/api.dart';
import 'package:app_desafio_inovacao/core/api/api_response.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class RequestRepository {
  ApiService api;

  RequestRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  create({
    @required String attribute,
    @required String value,
    @required String reason,
    @required String products,
  }) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/requests',
        body: {
          'attribute': attribute,
          'value': value,
          'reason': reason,
          'products': products
        });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) return true;

    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

  report({@required String idDataSheet, @required String products}) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/requests',
        body: {
          'idDatasheet': idDataSheet,
          'products': products,
          'report': true
        });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) return true;

    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
