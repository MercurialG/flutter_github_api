class Users {
  String login;
  String avatarUrl;
  int followers;

  Users({required this.login, required this.avatarUrl, required this.followers});



  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        login : json['login'], 
        avatarUrl : json['avatar_url'],
        followers : json['followers']
    );
  }
}


class AllUsers {
  List<Users> users;

  AllUsers({required this.users});

  factory AllUsers.fromJson(List<dynamic> json) {
    List<Users> users = <Users>[];
    users = json.map((r) => Users.fromJson(r)).toList();
    return AllUsers(users: users);
  }
}