part of '../configs.dart';

class AppMedia {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  static late double horizontal;
  static late double vertical;
  static late EdgeInsets padding;
  static late EdgeInsets vi;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeWidth;
  static late double safeHeight;

  static late double diagonal;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    padding = _mediaQueryData.padding;
    vi = _mediaQueryData.viewInsets;
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    horizontal = width / 100;
    vertical = height / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (width - _safeAreaHorizontal);
    safeHeight = (height - _safeAreaVertical);

    diagonal = sqrt((width * width) + (height * height));
  }

  static MediaQueryData media() => _mediaQueryData;

  static Size size() => media().size;
}
