import 'package:flutter/material.dart';

class ArrowWhirlUpPainter extends CustomPainter {
  const ArrowWhirlUpPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2366882, size.height * 0.9318131);
    path_0.cubicTo(
        size.width * 0.4289941,
        size.height * 0.8585859,
        size.width * 0.4561432,
        size.height * 0.8673434,
        size.width * 0.6001598,
        size.height * 0.6820202);
    path_0.cubicTo(
        size.width * 0.7483136,
        size.height * 0.4244707,
        size.width * 0.5600538,
        size.height * 0.3149899,
        size.width * 0.4672645,
        size.height * 0.3159914);
    path_0.cubicTo(
        size.width * 0.4021722,
        size.height * 0.3073732,
        size.width * 0.2127172,
        size.height * 0.4564449,
        size.width * 0.3584669,
        size.height * 0.5577879);
    path_0.cubicTo(
        size.width * 0.6230000,
        size.height * 0.7177980,
        size.width * 0.9445621,
        size.height * 0.3014884,
        size.width * 0.8629349,
        size.height * 0.1598333);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002958580;
    paint0Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002958580;
    paint1Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawLine(
        Offset(size.width * 1, size.height * -0.001262626),
        Offset(size.width * 0.08839112, size.height * -0.001262626),
        paint1Stroke);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002958580;
    paint2Stroke.color = const Color(0xffABABAB).withOpacity(1.0);
    canvas.drawLine(
        Offset(size.width * 1, size.height * -0.001262626),
        Offset(size.width * 0.07166568, size.height * -0.001262626),
        paint2Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
