import 'package:app_desafio_inovacao/core/api/api.dart';
import 'package:app_desafio_inovacao/core/api/api_response.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/models/user_model.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  ApiService api;

  AuthRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<User> login({@required email, @required pass}) async {
    ApiResponse response;
    try {
      response = await api.request(
          method: Method.post,
          path: '/users/login',
          body: {'email': email, 'pass': pass});
    } catch (e) {
      print('error $e');
    }

    if (response.statusCode == 200)
      return User(email: email, token: response.body['content']['token']);
    if (response.statusCode == 404) return throw NotFoundException();
    return throw UnknownException();
  }
}
