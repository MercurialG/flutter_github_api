class Repo {
  String name;
  String description;
  String updatedAt;
  String defaultBranch;
  int forks;
  int stargazersCount;
  String language;

  Repo(
      {this.name,
      this.description,
      this.updatedAt,
      this.defaultBranch,
      this.forks,
      this.stargazersCount,
      this.language});

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
}

class AllRepos {
  List<Repo> repos;

  AllRepos({this.repos});

  factory AllRepos.fromJson(List<dynamic> json) {
    List<Repo> repos = <Repo>[];
    repos = json.map((r) => Repo.fromJson(r)).toList();
    return AllRepos(repos: repos);
  }
}
