import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewEntity {
  ReviewEntity({
    required this.body,
    required this.id,
    required this.rating,
    required this.title,
    required this.movieId,
    required this.nodeId,
    required this.reviewer,
  });

  final String body;
  final String id;
  final int rating;
  final String title;
  final String movieId;
  final String nodeId;
  final UserEntity reviewer;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => ReviewEntity(
        body: json["body"],
        id: json["id"],
        rating: json["rating"],
        title: json["title"],
        movieId: json["movieId"],
        nodeId: json["nodeId"],
        reviewer: UserEntity.fromJson(json["userByUserReviewerId"]),
      );
}
