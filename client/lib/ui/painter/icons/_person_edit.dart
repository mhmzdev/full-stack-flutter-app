part of '../base.dart';

class PersonEditIconPainter extends CustomPainter {
  const PersonEditIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.5000000);
    path_0.cubicTo(
      size.width * 0.6150583,
      size.height * 0.5000000,
      size.width * 0.7083333,
      size.height * 0.4104560,
      size.width * 0.7083333,
      size.height * 0.3000000,
    );
    path_0.cubicTo(
      size.width * 0.7083333,
      size.height * 0.1895432,
      size.width * 0.6150583,
      size.height * 0.1000000,
      size.width * 0.5000000,
      size.height * 0.1000000,
    );
    path_0.cubicTo(
      size.width * 0.3849408,
      size.height * 0.1000000,
      size.width * 0.2916667,
      size.height * 0.1895432,
      size.width * 0.2916667,
      size.height * 0.3000000,
    );
    path_0.cubicTo(
      size.width * 0.2916667,
      size.height * 0.4104560,
      size.width * 0.3849408,
      size.height * 0.5000000,
      size.width * 0.5000000,
      size.height * 0.5000000,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint0Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8004208, size.height * 0.6496000);
    path_1.lineTo(size.width * 0.6529167, size.height * 0.7912040);
    path_1.cubicTo(
      size.width * 0.6470833,
      size.height * 0.7968040,
      size.width * 0.6416667,
      size.height * 0.8072000,
      size.width * 0.6404167,
      size.height * 0.8148000,
    );
    path_1.lineTo(size.width * 0.6325000, size.height * 0.8688000);
    path_1.cubicTo(
      size.width * 0.6295833,
      size.height * 0.8884000,
      size.width * 0.6437500,
      size.height * 0.9020000,
      size.width * 0.6641667,
      size.height * 0.8992000,
    );
    path_1.lineTo(size.width * 0.7204167, size.height * 0.8916000);
    path_1.cubicTo(
      size.width * 0.7283333,
      size.height * 0.8904000,
      size.width * 0.7395833,
      size.height * 0.8852000,
      size.width * 0.7450000,
      size.height * 0.8796000,
    );
    path_1.lineTo(size.width * 0.8925000, size.height * 0.7380000);
    path_1.cubicTo(
      size.width * 0.9179167,
      size.height * 0.7136000,
      size.width * 0.9300000,
      size.height * 0.6852000,
      size.width * 0.8925000,
      size.height * 0.6492000,
    );
    path_1.cubicTo(
      size.width * 0.8554167,
      size.height * 0.6136000,
      size.width * 0.8258375,
      size.height * 0.6252000,
      size.width * 0.8004208,
      size.height * 0.6496000,
    );
    path_1.close();

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint1Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7791750, size.height * 0.6700000);
    path_2.cubicTo(
      size.width * 0.7916750,
      size.height * 0.7132000,
      size.width * 0.8266750,
      size.height * 0.7468000,
      size.width * 0.8716750,
      size.height * 0.7588000,
    );

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint2Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.1420796, size.height * 0.9000000);
    path_3.cubicTo(
      size.width * 0.1420796,
      size.height * 0.7452000,
      size.width * 0.3024975,
      size.height * 0.6200000,
      size.width * 0.4999958,
      size.height * 0.6200000,
    );
    path_3.cubicTo(
      size.width * 0.5433292,
      size.height * 0.6200000,
      size.width * 0.5849958,
      size.height * 0.6260000,
      size.width * 0.6237458,
      size.height * 0.6372000,
    );

    Paint paint3Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint3Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.transparent;
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
