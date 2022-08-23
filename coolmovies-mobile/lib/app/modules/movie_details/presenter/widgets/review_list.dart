import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({
    Key? key,
    required this.reviews,
    required this.onEditReview,
  }) : super(key: key);

  final List<ReviewEntity> reviews;
  final void Function(ReviewEntity) onEditReview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: reviews
            .map(
              (review) => ReviewCardWidget(
                review: review,
                onEdit: () => onEditReview(review),
              ),
            )
            .toList(),
      ),
    );
  }
}
