import 'package:coolmovies/app/commons/utils/exports.dart';

class HomeStore {
  final movies = RxList<MovieEntity>([]);

  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  void load() => loading = true;

  void completeWithData(List<MovieEntity> data) {
    movies.assignAll(data);
    error = '';
    loading = false;
  }

  void completeWithError(String error) {
    this.error = error;
    movies.clear();
    loading = false;
  }

  StoreState get state {
    return loading
        ? StoreState.loading
        : error.isNotEmpty
            ? StoreState.error
            : movies.isEmpty
                ? StoreState.noContent
                : StoreState.await;
  }
}
