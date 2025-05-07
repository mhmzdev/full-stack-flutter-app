part of '../base.dart';

class CameraIconPainter extends CustomPainter {
  const CameraIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2903968, size.height * 0.9000000);
    path_0.lineTo(size.width * 0.7095960, size.height * 0.9000000);
    path_0.cubicTo(
      size.width * 0.8199960,
      size.height * 0.9000000,
      size.width * 0.8639960,
      size.height * 0.8324000,
      size.width * 0.8691960,
      size.height * 0.7500000,
    );
    path_0.lineTo(size.width * 0.8899960, size.height * 0.4196000);
    path_0.cubicTo(
      size.width * 0.8955960,
      size.height * 0.3332000,
      size.width * 0.8267960,
      size.height * 0.2600000,
      size.width * 0.7399960,
      size.height * 0.2600000,
    );
    path_0.cubicTo(
      size.width * 0.7155960,
      size.height * 0.2600000,
      size.width * 0.6931960,
      size.height * 0.2460000,
      size.width * 0.6819960,
      size.height * 0.2244000,
    );
    path_0.lineTo(size.width * 0.6531960, size.height * 0.1664000);
    path_0.cubicTo(
      size.width * 0.6347960,
      size.height * 0.1300000,
      size.width * 0.5867960,
      size.height * 0.1000000,
      size.width * 0.5459960,
      size.height * 0.1000000,
    );
    path_0.lineTo(size.width * 0.4543960, size.height * 0.1000000);
    path_0.cubicTo(
      size.width * 0.4131960,
      size.height * 0.1000000,
      size.width * 0.3651968,
      size.height * 0.1300000,
      size.width * 0.3467968,
      size.height * 0.1664000,
    );
    path_0.lineTo(size.width * 0.3179968, size.height * 0.2244000);
    path_0.cubicTo(
      size.width * 0.3067968,
      size.height * 0.2460000,
      size.width * 0.2843968,
      size.height * 0.2600000,
      size.width * 0.2599968,
      size.height * 0.2600000,
    );
    path_0.cubicTo(
      size.width * 0.1731968,
      size.height * 0.2600000,
      size.width * 0.1043968,
      size.height * 0.3332000,
      size.width * 0.1099968,
      size.height * 0.4196000,
    );
    path_0.lineTo(size.width * 0.1307968, size.height * 0.7500000);
    path_0.cubicTo(
      size.width * 0.1355968,
      size.height * 0.8324000,
      size.width * 0.1799968,
      size.height * 0.9000000,
      size.width * 0.2903968,
      size.height * 0.9000000,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint0Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4400000, size.height * 0.3400000);
    path_1.lineTo(size.width * 0.5600000, size.height * 0.3400000);

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint1Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.7400000);
    path_2.cubicTo(
      size.width * 0.5716000,
      size.height * 0.7400000,
      size.width * 0.6300000,
      size.height * 0.6816000,
      size.width * 0.6300000,
      size.height * 0.6100000,
    );
    path_2.cubicTo(
      size.width * 0.6300000,
      size.height * 0.5384000,
      size.width * 0.5716000,
      size.height * 0.4800000,
      size.width * 0.5000000,
      size.height * 0.4800000,
    );
    path_2.cubicTo(
      size.width * 0.4284000,
      size.height * 0.4800000,
      size.width * 0.3700000,
      size.height * 0.5384000,
      size.width * 0.3700000,
      size.height * 0.6100000,
    );
    path_2.cubicTo(
      size.width * 0.3700000,
      size.height * 0.6816000,
      size.width * 0.4284000,
      size.height * 0.7400000,
      size.width * 0.5000000,
      size.height * 0.7400000,
    );
    path_2.close();

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint2Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
