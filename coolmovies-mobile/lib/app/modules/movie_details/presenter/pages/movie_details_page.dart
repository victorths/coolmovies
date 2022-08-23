import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(controller.store.movie != null);
    final movie = controller.store.movie!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toReviewForm(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: Key(movie.id),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.30),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                      movie.imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Column(
                children: [
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 3,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        movie.rate.toString(),
                        style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      const Text('Score'),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 40,
                    width: 2,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        movie.releaseDate.formatDate,
                        style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      const Text('Premiere'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ReviewSectionWidget(
                controller: controller,
              ),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
