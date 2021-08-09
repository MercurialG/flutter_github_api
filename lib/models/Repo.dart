class Repo {
  String name;
  String description;
  String updatedAt;
  String defaultBranch;
  int forks;
  int stargazersCount;
  String language;

  Repo(
      {
        required this.name,
        required this.description,
        required this.updatedAt,
        required this.defaultBranch,
        required this.forks,
        required this.stargazersCount,
        required this.language
      });

  static Repo fromJson(json) {
    return Repo(
      name: json["name"] ?? "Missing",
      description: json["description"] ?? "Missing",
      updatedAt: json["updated_at"] ?? "Missing",
      defaultBranch: json["default_branch"] ?? "Missing",
      forks: json["forks"] ?? 0,
      stargazersCount: json["stargazers_count"] ?? 0,
      language: json["language"] ?? "Unknown",
    );
  }

}



