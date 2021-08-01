class Users {
  String login;
  String avatarUrl;
  int followers;

  Users({this.login, this.avatarUrl,this.followers});



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

  AllUsers({this.users});

  factory AllUsers.fromJson(List<dynamic> json) {
    List<Users> users = <Users>[];
    users = json.map((r) => Users.fromJson(r)).toList();
    return AllUsers(users: users);
  }
}