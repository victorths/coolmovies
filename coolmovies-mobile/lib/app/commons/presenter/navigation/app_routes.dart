part of 'app_pages.dart';

abstract class Routes {
  static const initial = _Paths.signIn;

  static const signIn = _Paths.signIn;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const signIn = '/sign_in';
  static const home = '/home';
}
