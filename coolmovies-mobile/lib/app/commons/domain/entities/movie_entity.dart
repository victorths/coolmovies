class MovieEntity {
  MovieEntity({
    required this.id,
    required this.imgUrl,
    required this.movieDirectorId,
    required this.userCreatorId,
    required this.title,
    required this.releaseDate,
    required this.nodeId,
  });

  final String id;
  final String imgUrl;
  final String movieDirectorId;
  final String userCreatorId;
  final String title;
  final DateTime releaseDate;
  final String nodeId;

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json["id"],
      imgUrl: json["imgUrl"],
      movieDirectorId: json["movieDirectorId"],
      userCreatorId: json["userCreatorId"],
      title: json["title"],
      releaseDate: DateTime.parse(json["releaseDate"]),
      nodeId: json["nodeId"],
    );
  }
}
