import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_github_api/utils/UsersApi.dart';
import 'package:flutter_github_api/main.dart';
import 'package:flutter_github_api/models/users.dart';
import 'package:flutter_github_api/controllers/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_api/views/ReposPage.dart';

class UsersSearch extends StatefulWidget {
  @override
  UsersSearchState createState() => UsersSearchState();
}

class UsersSearchState extends State<UsersSearch> {
  List<User> users = [];
  String query = 'mercurialg';
  Timer? debouncer;


  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final users = await UsersApi.getUsers(query);

    setState(() => this.users = users);
  }

  @override
  Widget build(BuildContext context)  {



    return Scaffold(

        appBar: AppBar(

          backgroundColor: Color(0xFF213641),
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xD9061D29),
          child: Column(
            children: <Widget>[
              buildSearch(),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return buildUser(user);
                  },
                ),
              ),
            ],
          ),
        ),
      );}

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Username',
        onChanged: searchUser,
      );

  Future searchUser(String query) async => debounce(() async {
        final users = await UsersApi.getUsers(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.users = users;
        });
      });

  Widget buildUser(User user) => GestureDetector(
    onTap: () {Navigator.pushNamed(context, RepoScreen.RepoScreenRoute,
    arguments: User(login: user.login, avatarUrl: user.avatarUrl,followers: user.followers));},
    child: Card(
        child: ListTile(
          leading: Image.network(
            user.avatarUrl,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              user.login,
              style: TextStyle(fontFamily: "roboto", color: (Colors.white)),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Followers: ' + user.followers.toString(),
              style: TextStyle(fontFamily: "roboto", color: (Colors.white)),
            ),
          ),
        ),
        color: Color(0xAA213641)),
  );
}
