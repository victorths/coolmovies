part of 'app_pages.dart';

abstract class Routes {
  static const initial = _Paths.signIn;

  static const signIn = _Paths.signIn;
  static const home = _Paths.home;
  static const movieDetails = _Paths.movieDetails;
  static const reviewForm = _Paths.reviewForm;
}

abstract class _Paths {
  static const signIn = '/sign_in';
  static const home = '/home';
  static const movieDetails = '/movie_details';
  static const reviewForm = '/review_form';
}
