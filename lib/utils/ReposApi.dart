import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_api/models/Repo.dart';
import 'package:http/http.dart' as http;

class ReposApi {
  static Future<List<Repo>> getRepos(login) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$login/repos'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map<Repo>(Repo.fromJson).toList();
    } else {
      throw Exception('Failed to fetch');
    }
  }
}
