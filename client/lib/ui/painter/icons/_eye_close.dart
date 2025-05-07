part of '../base.dart';

class EyeCloseIconPainter extends CustomPainter {
  const EyeCloseIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6054125, size.height * 0.3945800);
    path_0.lineTo(size.width * 0.3945800, size.height * 0.6054125);
    path_0.cubicTo(
      size.width * 0.3674967,
      size.height * 0.5783292,
      size.width * 0.3508300,
      size.height * 0.5412458,
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
      size.width * 0.5412458,
      size.height * 0.3508300,
      size.width * 0.5783292,
      size.height * 0.3674967,
      size.width * 0.6054125,
      size.height * 0.3945800,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint0Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7425042, size.height * 0.2404158);
    path_1.cubicTo(
      size.width * 0.6695875,
      size.height * 0.1854158,
      size.width * 0.5862542,
      size.height * 0.1554158,
      size.width * 0.5000042,
      size.height * 0.1554158,
    );
    path_1.cubicTo(
      size.width * 0.3529204,
      size.height * 0.1554158,
      size.width * 0.2158371,
      size.height * 0.2420825,
      size.width * 0.1204204,
      size.height * 0.3920825,
    );
    path_1.cubicTo(
      size.width * 0.08292042,
      size.height * 0.4508333,
      size.width * 0.08292042,
      size.height * 0.5495833,
      size.width * 0.1204204,
      size.height * 0.6083333,
    );
    path_1.cubicTo(
      size.width * 0.1533371,
      size.height * 0.6600000,
      size.width * 0.1916704,
      size.height * 0.7045833,
      size.width * 0.2333371,
      size.height * 0.7404167,
    );

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint1Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3508300, size.height * 0.8137458);
    path_2.cubicTo(
      size.width * 0.3983300,
      size.height * 0.8337458,
      size.width * 0.4487458,
      size.height * 0.8445792,
      size.width * 0.4999958,
      size.height * 0.8445792,
    );
    path_2.cubicTo(
      size.width * 0.6470792,
      size.height * 0.8445792,
      size.width * 0.7841625,
      size.height * 0.7579125,
      size.width * 0.8795792,
      size.height * 0.6079125,
    );
    path_2.cubicTo(
      size.width * 0.9170792,
      size.height * 0.5491625,
      size.width * 0.9170792,
      size.height * 0.4504125,
      size.width * 0.8795792,
      size.height * 0.3916637,
    );
    path_2.cubicTo(
      size.width * 0.8658292,
      size.height * 0.3699971,
      size.width * 0.8508292,
      size.height * 0.3495804,
      size.width * 0.8354125,
      size.height * 0.3304138,
    );

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint2Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6462458, size.height * 0.5291667);
    path_3.cubicTo(
      size.width * 0.6354125,
      size.height * 0.5879167,
      size.width * 0.5874958,
      size.height * 0.6358333,
      size.width * 0.5287458,
      size.height * 0.6466667,
    );

    Paint paint3Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint3Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = color ?? const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.3945833, size.height * 0.6054167);
    path_4.lineTo(size.width * 0.08333333, size.height * 0.9166667);

    Paint paint4Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint4Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint4Stroke.strokeCap = StrokeCap.round;
    paint4Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = color ?? const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.9166667, size.height * 0.08333333);
    path_5.lineTo(size.width * 0.6054167, size.height * 0.3945833);

    Paint paint5Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06250000;
    paint5Stroke.color =
        color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    paint5Stroke.strokeCap = StrokeCap.round;
    paint5Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_5, paint5Stroke);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = color ?? const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
