part of '../base.dart';

class ChatIconPainter extends CustomPainter {
  const ChatIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9000000, size.height * 0.4200000);
    path_0.lineTo(size.width * 0.9000000, size.height * 0.5400000);
    path_0.cubicTo(
      size.width * 0.9000000,
      size.height * 0.7000000,
      size.width * 0.8200000,
      size.height * 0.7800000,
      size.width * 0.6600000,
      size.height * 0.7800000,
    );
    path_0.lineTo(size.width * 0.6400000, size.height * 0.7800000);
    path_0.cubicTo(
      size.width * 0.6276000,
      size.height * 0.7800000,
      size.width * 0.6156000,
      size.height * 0.7860000,
      size.width * 0.6080000,
      size.height * 0.7960000,
    );
    path_0.lineTo(size.width * 0.5480000, size.height * 0.8760000);
    path_0.cubicTo(
      size.width * 0.5216000,
      size.height * 0.9112000,
      size.width * 0.4784000,
      size.height * 0.9112000,
      size.width * 0.4520000,
      size.height * 0.8760000,
    );
    path_0.lineTo(size.width * 0.3920000, size.height * 0.7960000);
    path_0.cubicTo(
      size.width * 0.3856000,
      size.height * 0.7872000,
      size.width * 0.3708000,
      size.height * 0.7800000,
      size.width * 0.3600000,
      size.height * 0.7800000,
    );
    path_0.lineTo(size.width * 0.3400000, size.height * 0.7800000);
    path_0.cubicTo(
      size.width * 0.1800000,
      size.height * 0.7800000,
      size.width * 0.1000000,
      size.height * 0.7400000,
      size.width * 0.1000000,
      size.height * 0.5400000,
    );
    path_0.lineTo(size.width * 0.1000000, size.height * 0.3400000);
    path_0.cubicTo(
      size.width * 0.1000000,
      size.height * 0.1800000,
      size.width * 0.1800000,
      size.height * 0.1000000,
      size.width * 0.3400000,
      size.height * 0.1000000,
    );
    path_0.lineTo(size.width * 0.5800000, size.height * 0.1000000);

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
    path_1.moveTo(size.width * 0.8000000, size.height * 0.3000000);
    path_1.cubicTo(
      size.width * 0.8552280,
      size.height * 0.3000000,
      size.width * 0.9000000,
      size.height * 0.2552284,
      size.width * 0.9000000,
      size.height * 0.2000000,
    );
    path_1.cubicTo(
      size.width * 0.9000000,
      size.height * 0.1447716,
      size.width * 0.8552280,
      size.height * 0.1000000,
      size.width * 0.8000000,
      size.height * 0.1000000,
    );
    path_1.cubicTo(
      size.width * 0.7447720,
      size.height * 0.1000000,
      size.width * 0.7000000,
      size.height * 0.1447716,
      size.width * 0.7000000,
      size.height * 0.2000000,
    );
    path_1.cubicTo(
      size.width * 0.7000000,
      size.height * 0.2552284,
      size.width * 0.7447720,
      size.height * 0.3000000,
      size.width * 0.8000000,
      size.height * 0.3000000,
    );
    path_1.close();

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
    path_2.moveTo(size.width * 0.6598600, size.height * 0.4600000);
    path_2.lineTo(size.width * 0.6602160, size.height * 0.4600000);

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08000000;
    paint2Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.4998200, size.height * 0.4600000);
    path_3.lineTo(size.width * 0.5001800, size.height * 0.4600000);

    Paint paint3Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08000000;
    paint3Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.transparent;
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.3397804, size.height * 0.4600000);
    path_4.lineTo(size.width * 0.3401396, size.height * 0.4600000);

    Paint paint4Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08000000;
    paint4Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint4Stroke.strokeCap = StrokeCap.round;
    paint4Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.transparent;
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
