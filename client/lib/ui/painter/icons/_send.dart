part of '../base.dart';

class SendIconPainter extends CustomPainter {
  const SendIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3083304, size.height * 0.2633396);
    path_0.lineTo(size.width * 0.6620792, size.height * 0.1454229);
    path_0.cubicTo(
      size.width * 0.8208292,
      size.height * 0.09250625,
      size.width * 0.9070792,
      size.height * 0.1791729,
      size.width * 0.8545792,
      size.height * 0.3379229,
    );
    path_0.lineTo(size.width * 0.7366625, size.height * 0.6916750);
    path_0.cubicTo(
      size.width * 0.6574958,
      size.height * 0.9295917,
      size.width * 0.5274958,
      size.height * 0.9295917,
      size.width * 0.4483292,
      size.height * 0.6916750,
    );
    path_0.lineTo(size.width * 0.4133304, size.height * 0.5866750);
    path_0.lineTo(size.width * 0.3083304, size.height * 0.5516750);
    path_0.cubicTo(
      size.width * 0.07041375,
      size.height * 0.4725083,
      size.width * 0.07041375,
      size.height * 0.3429229,
      size.width * 0.3083304,
      size.height * 0.2633396,
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
    path_1.moveTo(size.width * 0.4212542, size.height * 0.5687333);
    path_1.lineTo(size.width * 0.5704208, size.height * 0.4191500);

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
