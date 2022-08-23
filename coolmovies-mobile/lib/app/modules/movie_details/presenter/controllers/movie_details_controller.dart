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
      store.completeWithData(reviews);
    } catch (e) {
      final error = e.toString();
      store.completeWithError(error);
      debugPrint(error);
    }
  }

  void toReviewForm({ReviewEntity? review}) async {
    final userId = Get.find<UserStore>().currentUser?.id;
    bool? shouldUpdate = false;
    if (review == null) {
      if (store.movie?.id != null && userId != null) {
        shouldUpdate = await Get.toNamed(
          Routes.reviewForm,
          arguments: {
            'movieId': store.movie!.id,
            'reviewerId': userId,
          },
        );
      }
    } else {
      shouldUpdate = await Get.toNamed(Routes.reviewForm, arguments: review);
    }
    if (shouldUpdate != null && shouldUpdate) {
      _fetchReviews();
    }
  }
}
