import 'package:coolmovies/app/commons/utils/exports.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(
        () => SignInController(
          store: Get.find(),
          repository: UserRepository(
            client: Get.find(),
          ),
        ),
      ),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: BindingsBuilder.put(
        () => HomeController(
          store: HomeStore(),
          repository: MovieRepository(
            client: Get.find(),
          ),
        ),
      ),
    ),
    GetPage(
      name: _Paths.movieDetails,
      page: () => const MovieDetailsPage(),
      binding: BindingsBuilder.put(
        () => MovieDetailsController(
          store: MovieDetailsStore(),
          repository: MovieRepository(
            client: Get.find(),
          ),
        ),
      ),
    ),
    GetPage(
      name: _Paths.reviewForm,
      page: () => const ReviewFormPage(),
      binding: BindingsBuilder.put(
        () => ReviewFormController(
          store: ReviewFormStore(),
          repository: MovieRepository(
            client: Get.find(),
          ),
        ),
      ),
    ),
  ];
}
