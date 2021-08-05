class User {
  String login;
  String avatarUrl;
  int followers;
  // String reposUrl;

  User({
    required this.login,
    required this.avatarUrl,
    required this.followers,
    // required this.reposUrl,

  });

  factory User.fromJson(Map<String, dynamic> usersJson, followersJson,) => User(
        login: usersJson['login'],
        avatarUrl: usersJson['avatar_url'],
        followers: followersJson,
        // reposUrl: reposJson
    );

  Map<String, dynamic> toJson() => {
    'login': login,
    'avatarUrl': avatarUrl,
    'followers': followers,
    // 'reposUrl' : reposUrl,
  };
}


