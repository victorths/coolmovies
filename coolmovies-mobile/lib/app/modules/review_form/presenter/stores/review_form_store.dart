import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewFormStore {
  final _review = Rx<ReviewFormEntity>(ReviewFormEntity.empty(reviewerId: '', movieId: ''));
  ReviewFormEntity get review => _review.value;
  set review(ReviewFormEntity value) => _review.value = value;

  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  void load() => loading = true;

  void completeWithData(ReviewEntity data) {
    review = ReviewFormEntity.fromEntity(data);
    error = '';
    loading = false;
  }

  void completeWithError(String error) {
    this.error = error;
    loading = false;
  }

  StoreState get state {
    return loading
        ? StoreState.loading
        : error.isNotEmpty
            ? StoreState.error
            : StoreState.await;
  }
}
