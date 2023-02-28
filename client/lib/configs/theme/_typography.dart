part of '../configs.dart';

abstract class AppText {
  static late TextStyleRef h1;
  static late TextStyleRef h2;
  static late TextStyleRef h3;

  static late TextStyleRef b1;
  static late TextStyleRef b2;
  static late TextStyleRef b3;

  static late TextStyleRef s1;
  static late TextStyleRef s2;

  static String fontFamily = "Poppins";

  static void init() {
    final base = TextStyle(fontFamily: fontFamily);

    h1 = TextStyleRef(
      base
          .copyWith(fontSize: 20.font(), fontWeight: FontWeight.w700)
          .ratioHeight(),
      id: "h1",
    );
    h2 = TextStyleRef(
      base
          .copyWith(fontSize: 14.font(), fontWeight: FontWeight.w700)
          .ratioHeight(),
      id: "h2",
    );
    h3 = TextStyleRef(
      base
          .copyWith(fontSize: 11.font(), fontWeight: FontWeight.w700)
          .ratioHeight(),
      id: "h3",
    );

    //
    b1 = TextStyleRef(
      base.copyWith(fontSize: 8.5.font()).ratioHeight(),
      id: "b1",
    );
    b2 = TextStyleRef(
      base.copyWith(fontSize: 7.5.font()).ratioHeight(),
      id: "b2",
    );
    b3 = TextStyleRef(
      base.copyWith(fontSize: 7.font()).ratioHeight(),
      id: "b3",
    );

    //
    s1 = TextStyleRef(
      base.copyWith(fontSize: 6.font()).ratioHeight(),
      id: "s1",
    );
    s2 = TextStyleRef(
      base.copyWith(fontSize: 5.font()).ratioHeight(),
      id: "s2",
    );
  }
}
