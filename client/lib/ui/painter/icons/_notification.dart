part of '../base.dart';

class NotificationIconPainter extends CustomPainter {
  const NotificationIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5008040, size.height * 0.1364064);
    path_0.cubicTo(
      size.width * 0.3684036,
      size.height * 0.1364064,
      size.width * 0.2608036,
      size.height * 0.2440064,
      size.width * 0.2608036,
      size.height * 0.3764064,
    );
    path_0.lineTo(size.width * 0.2608036, size.height * 0.4920080);
    path_0.cubicTo(
      size.width * 0.2608036,
      size.height * 0.5164080,
      size.width * 0.2504036,
      size.height * 0.5536080,
      size.width * 0.2380036,
      size.height * 0.5744080,
    );
    path_0.lineTo(size.width * 0.1920036, size.height * 0.6508080);
    path_0.cubicTo(
      size.width * 0.1636036,
      size.height * 0.6980080,
      size.width * 0.1832036,
      size.height * 0.7504080,
      size.width * 0.2352036,
      size.height * 0.7680080,
    );
    path_0.cubicTo(
      size.width * 0.4076040,
      size.height * 0.8256080,
      size.width * 0.5936040,
      size.height * 0.8256080,
      size.width * 0.7660040,
      size.height * 0.7680080,
    );
    path_0.cubicTo(
      size.width * 0.8144040,
      size.height * 0.7520080,
      size.width * 0.8356040,
      size.height * 0.6948080,
      size.width * 0.8092040,
      size.height * 0.6508080,
    );
    path_0.lineTo(size.width * 0.7632040, size.height * 0.5744080);
    path_0.cubicTo(
      size.width * 0.7512040,
      size.height * 0.5536080,
      size.width * 0.7408040,
      size.height * 0.5164080,
      size.width * 0.7408040,
      size.height * 0.4920080,
    );
    path_0.lineTo(size.width * 0.7408040, size.height * 0.3764064);
    path_0.cubicTo(
      size.width * 0.7408040,
      size.height * 0.2444064,
      size.width * 0.6328040,
      size.height * 0.1364064,
      size.width * 0.5008040,
      size.height * 0.1364064,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint0Stroke.color = Colors.white.withValues(alpha: 1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5747960, size.height * 0.1480172);
    path_1.cubicTo(
      size.width * 0.5623960,
      size.height * 0.1444172,
      size.width * 0.5495960,
      size.height * 0.1416172,
      size.width * 0.5363960,
      size.height * 0.1400172,
    );
    path_1.cubicTo(
      size.width * 0.4979960,
      size.height * 0.1352172,
      size.width * 0.4611960,
      size.height * 0.1380172,
      size.width * 0.4267960,
      size.height * 0.1480172,
    );
    path_1.cubicTo(
      size.width * 0.4383960,
      size.height * 0.1184172,
      size.width * 0.4671960,
      size.height * 0.09761720,
      size.width * 0.5007960,
      size.height * 0.09761720,
    );
    path_1.cubicTo(
      size.width * 0.5343960,
      size.height * 0.09761720,
      size.width * 0.5631960,
      size.height * 0.1184172,
      size.width * 0.5747960,
      size.height * 0.1480172,
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
    path_2.moveTo(size.width * 0.6208000, size.height * 0.7823840);
    path_2.cubicTo(
      size.width * 0.6208000,
      size.height * 0.8483840,
      size.width * 0.5668000,
      size.height * 0.9023840,
      size.width * 0.5008000,
      size.height * 0.9023840,
    );
    path_2.cubicTo(
      size.width * 0.4680000,
      size.height * 0.9023840,
      size.width * 0.4376000,
      size.height * 0.8887840,
      size.width * 0.4160000,
      size.height * 0.8671840,
    );
    path_2.cubicTo(
      size.width * 0.3944008,
      size.height * 0.8455840,
      size.width * 0.3808008,
      size.height * 0.8151840,
      size.width * 0.3808008,
      size.height * 0.7823840,
    );

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint2Stroke.color = Colors.white.withValues(alpha: 1.0);
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
