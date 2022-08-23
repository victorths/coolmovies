import 'package:coolmovies/app/commons/utils/exports.dart';

class SignInController extends GetxController {
  SignInController({
    required this.repository,
    required this.store,
  });

  final UserRepository repository;
  final UserStore store;

  @override
  void onReady() {
    _fetchUsers();
    super.onReady();
  }

  void _fetchUsers() async {
    store.load();
    try {
      final users = await repository.fetchAllUsers();
      store.completeWithData(users);
    } catch (e) {
      final error = e.toString();
      store.completeWithError(error);
      debugPrint(error);
    }
  }

  void signIn() {
    Get.offNamed(Routes.home);
  }
}
