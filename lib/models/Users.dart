class User {
  String login;
  String avatarUrl;
  int followers;

  User({
    required this.login,
    required this.avatarUrl,
    required this.followers,

  });

  factory User.fromJson(Map<String, dynamic> usersJson, followersJson,) => User(
        login: usersJson['login'],
        avatarUrl: usersJson['avatar_url'],
        followers: followersJson,
    );

  Map<String, dynamic> toJson() => {
    'login': login,
    'avatarUrl': avatarUrl,
    'followers': followers,
  };
}


