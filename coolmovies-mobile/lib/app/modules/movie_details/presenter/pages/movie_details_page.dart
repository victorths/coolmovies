import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(controller.store.movie != null);
    final movie = controller.store.movie!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'addButton',
        onPressed: () => controller.toReviewForm(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MovieImageWidget(movie: movie),
              const SizedBox(
                height: 36,
              ),
              Obx(
                () => MovieDetailsWidget(
                  movie: movie,
                  rate: controller.store.movieRate(movie),
                ),
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
                heroTag: 'backButton',
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
