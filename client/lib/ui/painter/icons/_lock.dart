part of '../base.dart';

class LockIconPainter extends CustomPainter {
  const LockIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.4166667);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.3333333);
    path_0.cubicTo(
      size.width * 0.2500000,
      size.height * 0.1954167,
      size.width * 0.2916667,
      size.height * 0.08333333,
      size.width * 0.5000000,
      size.height * 0.08333333,
    );
    path_0.cubicTo(
      size.width * 0.7083333,
      size.height * 0.08333333,
      size.width * 0.7500000,
      size.height * 0.1954167,
      size.width * 0.7500000,
      size.height * 0.3333333,
    );
    path_0.lineTo(size.width * 0.7500000, size.height * 0.4166667);

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
    path_1.moveTo(size.width * 0.7083333, size.height * 0.9166667);
    path_1.lineTo(size.width * 0.2916667, size.height * 0.9166667);
    path_1.cubicTo(
      size.width * 0.1250000,
      size.height * 0.9166667,
      size.width * 0.08333333,
      size.height * 0.8750000,
      size.width * 0.08333333,
      size.height * 0.7083333,
    );
    path_1.lineTo(size.width * 0.08333333, size.height * 0.6250000);
    path_1.cubicTo(
      size.width * 0.08333333,
      size.height * 0.4583333,
      size.width * 0.1250000,
      size.height * 0.4166667,
      size.width * 0.2916667,
      size.height * 0.4166667,
    );
    path_1.lineTo(size.width * 0.7083333, size.height * 0.4166667);
    path_1.cubicTo(
      size.width * 0.8750000,
      size.height * 0.4166667,
      size.width * 0.9166667,
      size.height * 0.4583333,
      size.width * 0.9166667,
      size.height * 0.6250000,
    );
    path_1.lineTo(size.width * 0.9166667, size.height * 0.7083333);
    path_1.cubicTo(
      size.width * 0.9166667,
      size.height * 0.8750000,
      size.width * 0.8750000,
      size.height * 0.9166667,
      size.width * 0.7083333,
      size.height * 0.9166667,
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

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.6665208, size.height * 0.6666667);
    path_2.lineTo(size.width * 0.6668917, size.height * 0.6666667);

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint2Stroke.color =
        color ?? const Color(0xffABABAB).withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.4998125, size.height * 0.6666667);
    path_3.lineTo(size.width * 0.5001875, size.height * 0.6666667);

    Paint paint3Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint3Stroke.color =
        color ?? const Color(0xffABABAB).withValues(alpha: 1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.transparent;
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.3331046, size.height * 0.6666667);
    path_4.lineTo(size.width * 0.3334787, size.height * 0.6666667);

    Paint paint4Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint4Stroke.color =
        color ?? const Color(0xffABABAB).withValues(alpha: 1.0);
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
