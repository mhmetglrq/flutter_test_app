import 'package:flutter_test_app/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final http.Client httpClient;

  UserRepository(this.httpClient);

  Future<User> getUser() async {
    final response = await httpClient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
