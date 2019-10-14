import 'package:app_desafio_inovacao/core/api/api.dart';
import 'package:app_desafio_inovacao/core/api/api_response.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UserRepository {
  ApiService api;

  UserRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<bool> register({
    @required name,
    @required phone,
    @required email,
    @required pass,
  }) async {
    print('AQUI');
    try {
      ApiResponse response = await api.request(
          method: Method.post,
          path: '/users',
          body: {'name': name, 'phone': phone, 'email': email, 'pass': pass});

      if (response.statusCode == 200) return true;
      if (response.statusCode == 401) return throw BadRequestException();
      return throw UnknownException();
    } catch (e) {
      print(e);
    }
  }
}
