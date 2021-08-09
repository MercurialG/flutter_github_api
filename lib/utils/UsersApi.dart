import 'package:dio/dio.dart';
import 'package:flutter_github_api/models/Users.dart';

class UsersApi {
  static Future<List<User>> getUsers(String query) async {
    final dio = new Dio();
    final response =
        await dio.get('https://api.github.com/search/users?q=$query');

    if (response.statusCode == 200) {
      List<User> users = [];
      for (int i = 0; i < response.data["items"].length; i++) {
        final followersUrl = response.data["items"][i]["followers_url"];
        final followersResponse = await dio.get(followersUrl);
        users.add(User.fromJson(
            response.data["items"][i], followersResponse.data.length));
      }
      return users;
    } else {
      throw Exception();
    }
  }
}
