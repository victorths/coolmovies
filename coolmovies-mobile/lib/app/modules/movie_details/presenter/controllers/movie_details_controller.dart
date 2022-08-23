import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieDetailsController extends GetxController {
  MovieDetailsController({
    required this.repository,
    required this.store,
  });

  final MovieRepository repository;
  final MovieDetailsStore store;

  @override
  void onInit() {
    store.movie = Get.arguments as MovieEntity;
    super.onInit();
  }

  @override
  void onReady() {
    _fetchReviews();
    super.onReady();
  }

  void _fetchReviews() async {
    assert(store.movie != null);
    store.load();
    try {
      final reviews = await repository.fetchReviewsByMovieId(store.movie!.id);
      await 3.delay();
      store.completeWithData(reviews);
    } catch (e) {
      final error = e.toString();
      store.completeWithError(error);
      debugPrint(error);
    }
  }

  void toReviewForm({ReviewEntity? review}) async {
    await Get.toNamed(Routes.reviewForm, arguments: review);
    _fetchReviews();
  }
}
