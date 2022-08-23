class MovieEntity {
  MovieEntity({
    required this.id,
    required this.imgUrl,
    required this.movieDirectorId,
    required this.userCreatorId,
    required this.title,
    required this.releaseDate,
    required this.nodeId,
    required this.rate,
  });

  final String id;
  final String imgUrl;
  final String movieDirectorId;
  final String userCreatorId;
  final String title;
  final DateTime releaseDate;
  final String nodeId;
  final double rate;

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    final reviews = json['movieReviewsByMovieId']?['nodes'];
    double rate = 0;
    if (reviews != null) {
      reviews.cast<Map<String, dynamic>>();
      rate = reviews.map((js) => js['rating']).fold<double>(0.0, (double previousValue, rating) => (previousValue + rating) / 2);
    }

    return MovieEntity(
      id: json["id"],
      imgUrl: json["imgUrl"],
      movieDirectorId: json["movieDirectorId"],
      userCreatorId: json["userCreatorId"],
      title: json["title"],
      releaseDate: DateTime.parse(json["releaseDate"]),
      nodeId: json["nodeId"],
      rate: rate,
    );
  }
}
