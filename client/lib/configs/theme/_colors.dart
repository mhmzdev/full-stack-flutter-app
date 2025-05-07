part of '../configs.dart';

abstract class AppTheme {
  static const primary = ColorRef(Color(0xff538AF2), id: 'primary');

  static const backgroundDark = ColorRef(
    Color(0xff1B1A1D),
    id: 'backgroundDark',
  );
  static const backgroundLight = ColorRef(
    Color(0xff2C2E2F),
    id: 'backgroundLight',
  );

  static const text = ColorRef(Colors.white, id: 'text');

  static const grey = ColorRef(Color(0xffABABAB), id: 'grey');
  static const greyDark = ColorRef(Color(0xff3D3F41), id: 'greyDark');

  static const danger = ColorRef(Color(0xffE74C3C), id: 'danger');

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.grey,
    highlightColor: text.withValues(alpha: 0.1),
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: Theme.of(
      context,
    ).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.blue,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    brightness: Brightness.dark,
    highlightColor: text.withValues(alpha: 0.1),
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: backgroundDark,
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: text,
      displayColor: text,
      decorationColor: text,
    ),
  );
}
