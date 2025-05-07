part of '../base.dart';

class EyeIconPainter extends CustomPainter {
  const EyeIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6491625, size.height * 0.4999958);
    path_0.cubicTo(
      size.width * 0.6491625,
      size.height * 0.5824958,
      size.width * 0.5824958,
      size.height * 0.6491625,
      size.width * 0.4999958,
      size.height * 0.6491625,
    );
    path_0.cubicTo(
      size.width * 0.4174958,
      size.height * 0.6491625,
      size.width * 0.3508300,
      size.height * 0.5824958,
      size.width * 0.3508300,
      size.height * 0.4999958,
    );
    path_0.cubicTo(
      size.width * 0.3508300,
      size.height * 0.4174958,
      size.width * 0.4174958,
      size.height * 0.3508300,
      size.width * 0.4999958,
      size.height * 0.3508300,
    );
    path_0.cubicTo(
      size.width * 0.5824958,
      size.height * 0.3508300,
      size.width * 0.6491625,
      size.height * 0.4174958,
      size.width * 0.6491625,
      size.height * 0.4999958,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint0Stroke.color =
        color ?? const Color(0xffABABAB).withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000042, size.height * 0.8445833);
    path_1.cubicTo(
      size.width * 0.6470875,
      size.height * 0.8445833,
      size.width * 0.7841708,
      size.height * 0.7579167,
      size.width * 0.8795875,
      size.height * 0.6079167,
    );
    path_1.cubicTo(
      size.width * 0.9170875,
      size.height * 0.5491667,
      size.width * 0.9170875,
      size.height * 0.4504167,
      size.width * 0.8795875,
      size.height * 0.3916654,
    );
    path_1.cubicTo(
      size.width * 0.7841708,
      size.height * 0.2416654,
      size.width * 0.6470875,
      size.height * 0.1549987,
      size.width * 0.5000042,
      size.height * 0.1549987,
    );
    path_1.cubicTo(
      size.width * 0.3529204,
      size.height * 0.1549987,
      size.width * 0.2158371,
      size.height * 0.2416654,
      size.width * 0.1204204,
      size.height * 0.3916654,
    );
    path_1.cubicTo(
      size.width * 0.08292042,
      size.height * 0.4504167,
      size.width * 0.08292042,
      size.height * 0.5491667,
      size.width * 0.1204204,
      size.height * 0.6079167,
    );
    path_1.cubicTo(
      size.width * 0.2158371,
      size.height * 0.7579167,
      size.width * 0.3529204,
      size.height * 0.8445833,
      size.width * 0.5000042,
      size.height * 0.8445833,
    );
    path_1.close();

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint1Stroke.color =
        color ?? const Color(0xffABABAB).withValues(alpha: 1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
