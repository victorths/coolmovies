import 'package:coolmovies/app/commons/utils/exports.dart';

class HomeController extends GetxController {
  HomeController({
    required this.repository,
    required this.store,
  });

  final MovieRepository repository;
  final HomeStore store;

  @override
  void onReady() {
    _fetchMovies();
    super.onReady();
  }

  void _fetchMovies() async {
    store.load();
    try {
      final movies = await repository.fetchAllMovies();
      store.completeWithData(movies);
    } catch (e) {
      final error = e.toString();
      store.completeWithError(error);
      debugPrint(error);
    }
  }

  void navigateToMovie(MovieEntity movie) {
    Get.toNamed(Routes.movieDetails, arguments: movie);
  }
}
