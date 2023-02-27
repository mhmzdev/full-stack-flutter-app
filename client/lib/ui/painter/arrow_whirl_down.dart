import 'package:flutter/material.dart';

class ArrowWhirlUpPainter extends CustomPainter {
  const ArrowWhirlUpPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8997203, size.height * 0.008551729);
    path_0.cubicTo(
        size.width * 0.2478215,
        size.height * -0.006483556,
        size.width * -0.005341038,
        size.height * 0.1438880,
        size.width * 0.01364646,
        size.height * 0.3769617);
    path_0.cubicTo(
        size.width * 0.1402291,
        size.height * 0.6739594,
        size.width * 0.6782063,
        size.height * 0.6702030,
        size.width * 0.8554228,
        size.height * 0.6213308);
    path_0.cubicTo(
        size.width * 0.9946570,
        size.height * 0.5950203,
        size.width * 1.121242,
        size.height * 0.3694504,
        size.width * 0.6782038,
        size.height * 0.3581714);
    path_0.cubicTo(
        size.width * -0.08761759,
        size.height * 0.3581714,
        size.width * -0.04120392,
        size.height * 0.8807293,
        size.width * 0.3427620,
        size.height * 0.9596767);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.006329114;
    paint0Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.006329114;
    paint1Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawLine(Offset(size.width * 0.3696911, size.height * 0.9087068),
        Offset(size.width * 0.4539861, size.height * 0.9810752), paint1Stroke);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.006329114;
    paint2Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawLine(Offset(size.width * 0.4561772, size.height * 0.9793008),
        Offset(size.width * 0.2916203, size.height * 0.9943383), paint2Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
