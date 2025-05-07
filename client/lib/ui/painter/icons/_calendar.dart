part of '../base.dart';

class CalendarIconPainter extends CustomPainter {
  const CalendarIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3333333, size.height * 0.08333333);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.2083333);

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
    path_1.moveTo(size.width * 0.6666667, size.height * 0.08333333);
    path_1.lineTo(size.width * 0.6666667, size.height * 0.2083333);

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

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.1458333, size.height * 0.3787433);
    path_2.lineTo(size.width * 0.8541667, size.height * 0.3787433);

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint2Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.8750000, size.height * 0.3541667);
    path_3.lineTo(size.width * 0.8750000, size.height * 0.7083333);
    path_3.cubicTo(
      size.width * 0.8750000,
      size.height * 0.8333333,
      size.width * 0.8125000,
      size.height * 0.9166667,
      size.width * 0.6666667,
      size.height * 0.9166667,
    );
    path_3.lineTo(size.width * 0.3333333, size.height * 0.9166667);
    path_3.cubicTo(
      size.width * 0.1875000,
      size.height * 0.9166667,
      size.width * 0.1250000,
      size.height * 0.8333333,
      size.width * 0.1250000,
      size.height * 0.7083333,
    );
    path_3.lineTo(size.width * 0.1250000, size.height * 0.3541667);
    path_3.cubicTo(
      size.width * 0.1250000,
      size.height * 0.2291667,
      size.width * 0.1875000,
      size.height * 0.1458333,
      size.width * 0.3333333,
      size.height * 0.1458333,
    );
    path_3.lineTo(size.width * 0.6666667, size.height * 0.1458333);
    path_3.cubicTo(
      size.width * 0.8125000,
      size.height * 0.1458333,
      size.width * 0.8750000,
      size.height * 0.2291667,
      size.width * 0.8750000,
      size.height * 0.3541667,
    );
    path_3.close();

    Paint paint3Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint3Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.transparent;
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.6539458, size.height * 0.5708417);
    path_4.lineTo(size.width * 0.6543208, size.height * 0.5708417);

    Paint paint4Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint4Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint4Stroke.strokeCap = StrokeCap.round;
    paint4Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.transparent;
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.6539458, size.height * 0.6958417);
    path_5.lineTo(size.width * 0.6543208, size.height * 0.6958417);

    Paint paint5Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint5Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint5Stroke.strokeCap = StrokeCap.round;
    paint5Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_5, paint5Stroke);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.transparent;
    canvas.drawPath(path_5, paint5Fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.4998125, size.height * 0.5708417);
    path_6.lineTo(size.width * 0.5001875, size.height * 0.5708417);

    Paint paint6Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint6Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint6Stroke.strokeCap = StrokeCap.round;
    paint6Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_6, paint6Stroke);

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Colors.transparent;
    canvas.drawPath(path_6, paint6Fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.4998125, size.height * 0.6958417);
    path_7.lineTo(size.width * 0.5001875, size.height * 0.6958417);

    Paint paint7Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint7Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint7Stroke.strokeCap = StrokeCap.round;
    paint7Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_7, paint7Stroke);

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = Colors.transparent;
    canvas.drawPath(path_7, paint7Fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.3455962, size.height * 0.5708417);
    path_8.lineTo(size.width * 0.3459704, size.height * 0.5708417);

    Paint paint8Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint8Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint8Stroke.strokeCap = StrokeCap.round;
    paint8Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_8, paint8Stroke);

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = Colors.transparent;
    canvas.drawPath(path_8, paint8Fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.3455962, size.height * 0.6958417);
    path_9.lineTo(size.width * 0.3459704, size.height * 0.6958417);

    Paint paint9Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.08333333;
    paint9Stroke.color = const Color(0xffABABAB).withValues(alpha: 1.0);
    paint9Stroke.strokeCap = StrokeCap.round;
    paint9Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_9, paint9Stroke);

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = Colors.transparent;
    canvas.drawPath(path_9, paint9Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
