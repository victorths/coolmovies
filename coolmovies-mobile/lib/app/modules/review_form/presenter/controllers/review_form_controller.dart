import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewFormController extends GetxController {
  ReviewFormController({
    required this.repository,
    required this.store,
  });

  final MovieRepository repository;
  final ReviewFormStore store;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is ReviewEntity) {
      store.review = ReviewFormEntity.fromEntity(args);
    } else {
      store.review = ReviewFormEntity.empty(movieId: args['movieId'], reviewerId: args['reviewerId']);
    }
    super.onInit();
  }

  void submitForm() async {
    try {
      final sucess = await repository.submitForm(store.review.toMutation(), store.review.id);
      if (sucess) {
        Get.back(result: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
