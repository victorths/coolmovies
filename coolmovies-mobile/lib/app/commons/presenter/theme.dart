import 'package:coolmovies/app/commons/utils/exports.dart';

class CustomTheme {
  static ThemeData build() => ThemeData(
        colorScheme: colorScheme,
        textTheme: primaryTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: colorScheme.background,
            ),
          ),
        ),
      );
}

final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6FC2D0), onPrimary: Colors.white);

const TextTheme primaryTextTheme = TextTheme(
  headline1: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  headline2: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  ),
  headline3: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  ),
  headline4: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  headline6: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
  ),
  bodyText1: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  bodyText2: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  subtitle1: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  ),
  subtitle2: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  ),
  button: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  caption: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  ),
  overline: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
  ),
);
