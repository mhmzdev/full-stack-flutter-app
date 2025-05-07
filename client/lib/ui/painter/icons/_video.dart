part of '../base.dart';

class VideoIconPainter extends CustomPainter {
  const VideoIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5212000, size.height * 0.8508375);
    path_0.lineTo(size.width * 0.2684000, size.height * 0.8508375);
    path_0.cubicTo(
      size.width * 0.1420000,
      size.height * 0.8508375,
      size.width * 0.1000000,
      size.height * 0.7633375,
      size.width * 0.1000000,
      size.height * 0.6754208,
    );
    path_0.lineTo(size.width * 0.1000000, size.height * 0.3245867);
    path_0.cubicTo(
      size.width * 0.1000000,
      size.height * 0.1929200,
      size.width * 0.1420000,
      size.height * 0.1491700,
      size.width * 0.2684000,
      size.height * 0.1491700,
    );
    path_0.lineTo(size.width * 0.5212000, size.height * 0.1491700);
    path_0.cubicTo(
      size.width * 0.6476000,
      size.height * 0.1491700,
      size.width * 0.6896000,
      size.height * 0.1929200,
      size.width * 0.6896000,
      size.height * 0.3245867,
    );
    path_0.lineTo(size.width * 0.6896000, size.height * 0.6754208);
    path_0.cubicTo(
      size.width * 0.6896000,
      size.height * 0.8070875,
      size.width * 0.6472000,
      size.height * 0.8508375,
      size.width * 0.5212000,
      size.height * 0.8508375,
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
    path_1.moveTo(size.width * 0.8008000, size.height * 0.7125042);
    path_1.lineTo(size.width * 0.6896000, size.height * 0.6312542);
    path_1.lineTo(size.width * 0.6896000, size.height * 0.3683387);
    path_1.lineTo(size.width * 0.8008000, size.height * 0.2870888);
    path_1.cubicTo(
      size.width * 0.8552000,
      size.height * 0.2475054,
      size.width * 0.9000000,
      size.height * 0.2716721,
      size.width * 0.9000000,
      size.height * 0.3412554,
    );
    path_1.lineTo(size.width * 0.9000000, size.height * 0.6587542);
    path_1.cubicTo(
      size.width * 0.9000000,
      size.height * 0.7283375,
      size.width * 0.8552000,
      size.height * 0.7525042,
      size.width * 0.8008000,
      size.height * 0.7125042,
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
    path_2.moveTo(size.width * 0.4800000, size.height * 0.4583333);
    path_2.cubicTo(
      size.width * 0.5131360,
      size.height * 0.4583333,
      size.width * 0.5400000,
      size.height * 0.4303500,
      size.width * 0.5400000,
      size.height * 0.3958333,
    );
    path_2.cubicTo(
      size.width * 0.5400000,
      size.height * 0.3613154,
      size.width * 0.5131360,
      size.height * 0.3333333,
      size.width * 0.4800000,
      size.height * 0.3333333,
    );
    path_2.cubicTo(
      size.width * 0.4468640,
      size.height * 0.3333333,
      size.width * 0.4200000,
      size.height * 0.3613154,
      size.width * 0.4200000,
      size.height * 0.3958333,
    );
    path_2.cubicTo(
      size.width * 0.4200000,
      size.height * 0.4303500,
      size.width * 0.4468640,
      size.height * 0.4583333,
      size.width * 0.4800000,
      size.height * 0.4583333,
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
