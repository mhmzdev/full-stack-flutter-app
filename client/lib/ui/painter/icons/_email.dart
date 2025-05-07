part of '../base.dart';

class EmailIconPainter extends CustomPainter {
  const EmailIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7083333, size.height * 0.8541667);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.8541667);
    path_0.cubicTo(
      size.width * 0.1666667,
      size.height * 0.8541667,
      size.width * 0.08333333,
      size.height * 0.7916667,
      size.width * 0.08333333,
      size.height * 0.6458333,
    );
    path_0.lineTo(size.width * 0.08333333, size.height * 0.3541667);
    path_0.cubicTo(
      size.width * 0.08333333,
      size.height * 0.2083333,
      size.width * 0.1666667,
      size.height * 0.1458333,
      size.width * 0.2916667,
      size.height * 0.1458333,
    );
    path_0.lineTo(size.width * 0.7083333, size.height * 0.1458333);
    path_0.cubicTo(
      size.width * 0.8333333,
      size.height * 0.1458333,
      size.width * 0.9166667,
      size.height * 0.2083333,
      size.width * 0.9166667,
      size.height * 0.3541667,
    );
    path_0.lineTo(size.width * 0.9166667, size.height * 0.6458333);
    path_0.cubicTo(
      size.width * 0.9166667,
      size.height * 0.7916667,
      size.width * 0.8333333,
      size.height * 0.8541667,
      size.width * 0.7083333,
      size.height * 0.8541667,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint0Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7083333, size.height * 0.3750000);
    path_1.lineTo(size.width * 0.5779167, size.height * 0.4791667);
    path_1.cubicTo(
      size.width * 0.5350000,
      size.height * 0.5133333,
      size.width * 0.4645833,
      size.height * 0.5133333,
      size.width * 0.4216667,
      size.height * 0.4791667,
    );
    path_1.lineTo(size.width * 0.2916667, size.height * 0.3750000);

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint1Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
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
