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
  ];
}
