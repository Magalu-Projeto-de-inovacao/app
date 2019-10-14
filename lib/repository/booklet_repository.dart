import 'package:app_desafio_inovacao/core/api/api.dart';
import 'package:app_desafio_inovacao/core/api/api_response.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/models/booklet_model.dart';
import 'package:app_desafio_inovacao/models/item_list_person_booklet.dart';
import 'package:app_desafio_inovacao/models/person_model.dart';
import 'package:app_desafio_inovacao/models/person_model.dart';
import 'package:app_desafio_inovacao/models/user_model.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class BookletRepository {
  ApiService api;

  BookletRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  read() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/booklet');

    if (response.statusCode == 200)
      return List<Booklet>.from(
          response.body.map((item) => Booklet.fromJSON(item)).toList());
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
