import 'package:flutter_github_api/models/Users.dart';
import 'package:flutter_github_api/views/ReposPage.dart';
import 'package:flutter_github_api/views/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Github Users Search';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          '/': (context) => UsersSearch(),
        },
        //Sending username from clicked user to ReposPage
        onGenerateRoute: (settings) {
          if (settings.name == RepoScreen.RepoScreenRoute) {
            final args = settings.arguments as User;

            return MaterialPageRoute(
              builder: (context) {
                return RepoScreen(
                    login: args.login,
                    avatarUrl: args.avatarUrl,
                    followers: args.followers,);
                    // reposUrl : args.reposUrl);
              },
            );
          }
        },
      );
}

