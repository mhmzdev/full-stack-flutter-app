part of '../base.dart';

class CommentIconPainter extends CustomPainter {
  const CommentIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3600000, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.3400000, size.height * 0.7916667);
    path_0.cubicTo(
      size.width * 0.1800000,
      size.height * 0.7916667,
      size.width * 0.1000000,
      size.height * 0.7500000,
      size.width * 0.1000000,
      size.height * 0.5416667,
    );
    path_0.lineTo(size.width * 0.1000000, size.height * 0.3333333);
    path_0.cubicTo(
      size.width * 0.1000000,
      size.height * 0.1666667,
      size.width * 0.1800000,
      size.height * 0.08333333,
      size.width * 0.3400000,
      size.height * 0.08333333,
    );
    path_0.lineTo(size.width * 0.6600000, size.height * 0.08333333);
    path_0.cubicTo(
      size.width * 0.8200000,
      size.height * 0.08333333,
      size.width * 0.9000000,
      size.height * 0.1666667,
      size.width * 0.9000000,
      size.height * 0.3333333,
    );
    path_0.lineTo(size.width * 0.9000000, size.height * 0.5416667);
    path_0.cubicTo(
      size.width * 0.9000000,
      size.height * 0.7083333,
      size.width * 0.8200000,
      size.height * 0.7916667,
      size.width * 0.6600000,
      size.height * 0.7916667,
    );
    path_0.lineTo(size.width * 0.6400000, size.height * 0.7916667);
    path_0.cubicTo(
      size.width * 0.6276000,
      size.height * 0.7916667,
      size.width * 0.6156000,
      size.height * 0.7979167,
      size.width * 0.6080000,
      size.height * 0.8083333,
    );
    path_0.lineTo(size.width * 0.5480000, size.height * 0.8916667);
    path_0.cubicTo(
      size.width * 0.5216000,
      size.height * 0.9283333,
      size.width * 0.4784000,
      size.height * 0.9283333,
      size.width * 0.4520000,
      size.height * 0.8916667,
    );
    path_0.lineTo(size.width * 0.3920000, size.height * 0.8083333);
    path_0.cubicTo(
      size.width * 0.3856000,
      size.height * 0.7991667,
      size.width * 0.3708000,
      size.height * 0.7916667,
      size.width * 0.3600000,
      size.height * 0.7916667,
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
    path_1.moveTo(size.width * 0.3000000, size.height * 0.3333333);
    path_1.lineTo(size.width * 0.7000000, size.height * 0.3333333);

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
    path_2.moveTo(size.width * 0.3000000, size.height * 0.5416667);
    path_2.lineTo(size.width * 0.5400000, size.height * 0.5416667);

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
