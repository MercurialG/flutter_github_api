import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_github_api/models/repo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_github_api/models/users.dart';
import 'package:flutter_github_api/utils/UsersApi.dart';

class ReposApi {


  Future<All> getRepos(login) async {

    final response =
    await http.get(Uri.parse('https://api.github.com/users/$login/repos'));


    // if (response.statusCode == 200) {
    //   List<All> repo = [];
    //   for (int i = 0; i < response.data[0].length; i++) {
    //     repo.add(All.fromJson(response.data[0][i]));
    //     print(repo);
    //   }
    //
    //   return repo;
    // } else {
    //   throw Exception();
    // }

    if (response.statusCode == 200) {
      return All.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch');
    }
  }
}

