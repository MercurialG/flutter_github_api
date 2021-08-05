class Repo {
  String name;
  String description;
  String updatedAt;
  String defaultBranch;
  int forks;
  int stargazersCount;
  String language;

  Repo(
      { required this.name,
        required this.description,
        required this.updatedAt,
        required this.defaultBranch,
        required this.forks,
        required this.stargazersCount,
        required this.language});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      name: json['name'],
      description: json['description'],
      updatedAt: json['updatedAt'],
      defaultBranch: json['defaultBranch'],
      forks: json['forks'],
      stargazersCount: json['stargazersCount'],
      language: json['language'],
    );
  }

//
// class AllRepos {
//   List<Repo> repos;
//
//   AllRepos({required this.repos});
//
//   // factory AllRepos.fromJson(List<dynamic> json) {
//   //   List<Repo> repos = <Repo>[];
//   //   repos = json.map((r) => Repo.fromJson(r)).toList();
//   //   return AllRepos(repos: repos);
//   // }
// }
// factory Repo.fromJson(Map<String, dynamic> json) => Repo(
//     name: json['name'],
//     description: json['description'],
//     updatedAt: json['updatedAt'],
//     defaultBranch: json['defaultBranch'],
//     forks: json['forks'],
//     stargazersCount: json['stargazersCount'],
//     language: json['language'],
// );

// Map<String, dynamic> toJson() => {
//   'name': name,
//   'description' : description ,
//   'updatedAt': updatedAt ,
//   'defaultBranch' : defaultBranch,
//   'forks' : forks,
//   'stargazersCount' : stargazersCount,
//   'language' : language,
// };

}

class All {
  List<Repo> repos;

  All({required this.repos});

  factory All.fromJson(List<dynamic> json) {
    List<Repo> repos = <Repo>[];
    repos = json.map((r) => Repo.fromJson(r)).toList();
    return All(repos: repos);
  }
}

// List<Repo> repos = [];
// for (int i = 0; i < response.data["items"].length; i++) {
//   repos.add(Repo.fromJson(response.data["items"][i]))
// }