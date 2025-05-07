part of '../base.dart';

class AddIconPainter extends CustomPainter {
  const AddIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2555556, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.7444444, size.height * 0.5000000);

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.03333333;
    paint0Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.7444444);
    path_1.lineTo(size.width * 0.5000000, size.height * 0.2555556);

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.03333333;
    paint1Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
