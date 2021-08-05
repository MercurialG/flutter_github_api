import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_github_api/models/repo.dart';
import 'package:flutter_github_api/models/users.dart';
import 'package:flutter_github_api/utils/ReposApi.dart';


class RepoScreen extends StatefulWidget {
  const RepoScreen({Key? key, required this.login, avatarUrl, followers}) : super(key: key);
  @override
  _RepoScreenState createState() => _RepoScreenState();
  static const RepoScreenRoute = '/RepoScreen';
  final login;
}

class _RepoScreenState extends State<RepoScreen> {
  final reposApi = ReposApi();
  late Future<All> futureRepo;
  // late Future<All> ge;


  @override
  void initState() {
    super.initState();
    futureRepo = reposApi.getRepos(widget.login);
  }

  // Future init(login) async {
  //   final allRepos = await ReposApi.getRepos(login);
  //   print(allRepos);
  //
  // }


  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder<All>(
              future: futureRepo,
              builder: (context, AsyncSnapshot snapshot) {

                if (snapshot.hasData) {
                  List<Repo> repos = <Repo>[];
                  print(snapshot.data.repos);
                  for (int i = 0; i < snapshot.data!.repos.length; i++) {
                    repos.add(
                      Repo(
                        name: snapshot.data!.repos[i].name,
                        description: snapshot.data!.repos[i].description,
                        updatedAt: snapshot.data!.repos[i].updatedAt,
                        defaultBranch: snapshot.data!.repos[i].defaultBranch,
                        forks: snapshot.data!.repos[i].forks,
                        stargazersCount: snapshot.data!.repos[i]
                            .stargazersCount,
                        language: snapshot.data!.repos[i].language,
                      ),
                    );
                    print(repos);
                  }
                  return ListView(
                    children: repos.map((r) =>
                        Card(
                          color: Colors.deepPurple[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      r.name,
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    Text(r.stargazersCount.toString()),
                                  ],
                                ),
                                Text(r.description,
                                    style: TextStyle(fontSize: 20.0)),
                                Text(r.description,
                                    style: TextStyle(fontSize: 20.0)),
                                Text(r.updatedAt,
                                    style: TextStyle(fontSize: 20.0)),
                                Text(r.defaultBranch,
                                    style: TextStyle(fontSize: 20.0)),
                                Text(r.forks.toString()),
                                Text(r.stargazersCount.toString()),
                                Text(r.language,
                                    style: TextStyle(fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('Error'));

                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      )
  );
  // Widget build(BuildContext context) {
  //
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: ListView.builder(
  //       itemCount: allRepos.length,
  //       itemBuilder : (context, index) {
  //         final repo = allRepos[index];
  //       return new ListTile(
  //       title: Text(repo.repos[index].name),
  //       subtitle: Text(repo.repos[index].description),
  //       );
  //   })
  //   );
  // }
}
// class RepoScreen extends StatefulWidget {
//   @override
//   _RepoScreenState createState() => _RepoScreenState();
// }
//
// class ReposScreenState extends State<RepoScreen> {
//   const RepoScreen({Key? key, required this.user}) : super(key: key);
//   List<Repo> repos = [];
//   String query = 'mercurialg';
//   Timer? debouncer;
//
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }
//
//   @override
//   void dispose() {
//     debouncer?.cancel();
//     super.dispose();
//   }
//
//   void debounce(VoidCallback callback, {
//     Duration duration = const Duration(milliseconds: 1000),
//   }) {
//     if (debouncer != null) {
//       debouncer!.cancel();
//     }
//
//     debouncer = Timer(duration, callback);
//   }
//
//   Future init() async {
//     final users = await ReposApi.getRepos(query);
//
//     setState(() => this.users = users);
//   }
//
//   Future<AllRepos> fetchRepos() async {
//     final dio = new Dio();
//     final response =
//     await dio.get('https://api.github.com/users/mercurialg/repos');
//     if (response.statusCode == 200) {
//       return AllRepos.fromJson(json.decode(response.data));
//     } else {
//       throw Exception('Failed to fetch');
//     }
//   }
//
// }




// class _RepoScreenState extends State<RepoScreen> {
//   late Future<AllRepos> futureRepo;
//
//   @override
//   void initState() {
//     super.initState();
//     futureRepo = fetchRepos();
//   }
//
//   Widget buildUser(Repo repo) => GestureDetector(
//     onTap: () {Navigator.pushNamed(context, '/repos');},
//     child: Card(
//         child: ListTile(
//           title: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text(repo.name, style: TextStyle(fontFamily: "roboto", color: (Colors.white))),
//           ),
//           subtitle: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text('Followers: ', style: TextStyle(fontFamily: "roboto", color: (Colors.white)),
//
//             ),
//           ),
//         ),
//         color: Color(0xAA213641)),
//   );

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Github API')),
//         body: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Container(
//             child: FutureBuilder<AllRepos>(
//                 future: futureRepo,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     List<Repo> repos = <Repo>[];
//                     for (int i = 0; i < snapshot.data!.repos.length; i++) {
//                       repos.add(
//                         Repo(
//                           name: snapshot.data!.repos[i].name,
//                           description: snapshot.data!.repos[i].description,
//                           updatedAt: snapshot.data!.repos[i].updatedAt,
//                           defaultBranch: snapshot.data!.repos[i].defaultBranch,
//                           forks: snapshot.data!.repos[i].forks,
//                           stargazersCount:
//                               snapshot.data!.repos[i].stargazersCount,
//                           language: snapshot.data!.repos[i].language,
//                         ),
//                       );
//                     }
//                     return ListView(
//                       children: repos
//                           .map((r) => Card(
//                                 color: Colors.deepPurple[300],
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             r.name,
//                                             style: TextStyle(fontSize: 30.0),
//                                           ),
//                                           Text(r.stargazersCount.toString()),
//                                         ],
//                                       ),
//                                       Text(r.description,
//                                           style: TextStyle(fontSize: 20.0)),
//                                       Text(r.description,
//                                           style: TextStyle(fontSize: 20.0)),
//                                       Text(r.updatedAt,
//                                           style: TextStyle(fontSize: 20.0)),
//                                       Text(r.defaultBranch,
//                                           style: TextStyle(fontSize: 20.0)),
//                                       Text(r.forks.toString()),
//                                       Text(r.stargazersCount.toString()),
//                                       Text(r.language,
//                                           style: TextStyle(fontSize: 20.0)),
//                                     ],
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error'));
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 }),
//           ),
//         ));
//   }
 }
