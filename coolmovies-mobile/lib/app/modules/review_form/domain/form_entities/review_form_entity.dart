import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewFormEntity {
  ReviewFormEntity({
    required int rating,
    required String title,
    required String body,
    required this.movieId,
    required this.userReviewerId,
    required this.id,
  }) {
    this.rating = rating;
    titleController.text = title;
    bodyController.text = body;
  }

  factory ReviewFormEntity.fromEntity(ReviewEntity entity) => ReviewFormEntity(
        id: entity.nodeId,
        rating: entity.rating,
        title: entity.title,
        body: entity.body,
        movieId: entity.movieId,
        userReviewerId: entity.reviewer.id,
      );

  factory ReviewFormEntity.empty({
    required String reviewerId,
    required String movieId,
  }) =>
      ReviewFormEntity(
        id: null,
        rating: 1,
        title: '',
        body: '',
        movieId: movieId,
        userReviewerId: reviewerId,
      );

  final _rating = 0.obs;
  int get rating => _rating.value;
  set rating(int value) => _rating.value = value;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  String? id;
  String movieId;
  String userReviewerId;

  String toMutation() {
    return """
      {
        title: "${titleController.text}",
        body: "${bodyController.text}",
        rating: $rating,
        movieId: "$movieId",
        userReviewerId: "$userReviewerId",
      }
    """;
  }
}
