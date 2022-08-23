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
        iconTheme: const IconThemeData(size: 30),
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

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF6FC2D0),
  secondary: const Color(0xFFFF8246),
  tertiary: const Color(0xFF373A6D),
  onPrimary: Colors.white,
  onBackground: const Color.fromARGB(255, 192, 196, 197),
);

TextTheme primaryTextTheme = TextTheme(
  headline1: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  ),
  headline2: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  ),
  headline3: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  ),
  headline4: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  headline5: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  headline6: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  ),
  bodyText1: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  bodyText2: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  subtitle1: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  ),
  subtitle2: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  ),
  button: TextStyle(
    color: colorScheme.tertiary,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ),
  caption: TextStyle(
    color: colorScheme.tertiary,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  ),
  overline: TextStyle(
    color: colorScheme.tertiary,
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
  ),
);
