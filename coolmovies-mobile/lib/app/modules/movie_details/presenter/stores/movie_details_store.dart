import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieDetailsStore {
  final reviews = RxList<ReviewEntity>([]);

  final _movie = Rx<MovieEntity?>(null);
  MovieEntity? get movie => _movie.value;
  set movie(MovieEntity? value) => _movie.value = value;

  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  void load() => loading = true;

  void completeWithData(List<ReviewEntity> data) {
    reviews.assignAll(data);
    error = '';
    loading = false;
  }

  void completeWithError(String error) {
    this.error = error;
    reviews.clear();
    loading = false;
  }

  StoreState get state {
    return loading
        ? StoreState.loading
        : error.isNotEmpty
            ? StoreState.error
            : reviews.isEmpty
                ? StoreState.noContent
                : StoreState.await;
  }
}
