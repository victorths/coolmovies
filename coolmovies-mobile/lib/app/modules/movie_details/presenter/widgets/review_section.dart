import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewSectionWidget extends StatelessWidget {
  const ReviewSectionWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 40,
              width: 3,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'Reviews',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
        Obx(() {
          switch (controller.store.state) {
            case StoreState.loading:
              return const ReviewLoadingWidget();
            case StoreState.await:
              return ReviewListWidget(
                reviews: controller.store.reviews,
                onEditReview: (review) => controller.toReviewForm(review: review),
              );
            case StoreState.error:
              return const ReviewErrorWidget();
            case StoreState.noContent:
              return const ReviewNotFoundWidget();
          }
        }),
      ],
    );
  }
}
