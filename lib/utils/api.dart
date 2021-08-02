import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_api/models/users.dart';

class UsersApi {
  static Future<List<User>> getUsers(String query) async {
    final dio = new Dio();
    final response = await dio.get('https://api.github.com/search/users?q=$query');


    if (response.statusCode == 200) {

      // final followersResponse = await dio.get('https://api.github.com/search/users?q=$query/followers');
      // print(followersResponse.data["total_count"]);

      List<User> users = [];
      for (int i = 0; i < response.data["items"].length; i++) {
        final followersUrl = response.data["items"][i]["followers_url"];
        print(followersUrl);
        final followersResponse = await dio.get(followersUrl);
        print(followersResponse.data.length);
        users.add(User.fromJson(response.data["items"][i], followersResponse.data.length));
      }

      return users;

    } else {
      throw Exception();
    }
  }
}