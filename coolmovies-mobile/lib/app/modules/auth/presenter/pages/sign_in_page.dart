import 'package:coolmovies/app/commons/utils/exports.dart';
import 'package:coolmovies/app/modules/auth/presenter/widgets/input_select_user.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Welcome to Coolmovies APP',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InputSelectUser(
                      onSelectUser: (user) => controller.store.currentUser = user,
                      users: controller.store.users.toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: controller.store.currentUser != null ? controller.signIn : null,
                      child: const Text(
                        'Sign in',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
