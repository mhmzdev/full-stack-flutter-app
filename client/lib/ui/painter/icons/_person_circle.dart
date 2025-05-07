part of '../base.dart';

class PersonCircleIconPainter extends CustomPainter {
  const PersonCircleIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5050000, size.height * 0.5312200);
    path_0.cubicTo(
      size.width * 0.5020833,
      size.height * 0.5308200,
      size.width * 0.4983333,
      size.height * 0.5308200,
      size.width * 0.4950000,
      size.height * 0.5312200,
    );
    path_0.cubicTo(
      size.width * 0.4216667,
      size.height * 0.5288200,
      size.width * 0.3633321,
      size.height * 0.4712200,
      size.width * 0.3633321,
      size.height * 0.4004200,
    );
    path_0.cubicTo(
      size.width * 0.3633321,
      size.height * 0.3280188,
      size.width * 0.4241667,
      size.height * 0.2692188,
      size.width * 0.5000000,
      size.height * 0.2692188,
    );
    path_0.cubicTo(
      size.width * 0.5754167,
      size.height * 0.2692188,
      size.width * 0.6366667,
      size.height * 0.3280188,
      size.width * 0.6366667,
      size.height * 0.4004200,
    );
    path_0.cubicTo(
      size.width * 0.6362500,
      size.height * 0.4712200,
      size.width * 0.5783333,
      size.height * 0.5288200,
      size.width * 0.5050000,
      size.height * 0.5312200,
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
    path_1.moveTo(size.width * 0.7808333, size.height * 0.7951840);
    path_1.cubicTo(
      size.width * 0.7066667,
      size.height * 0.8603840,
      size.width * 0.6083333,
      size.height * 0.8999840,
      size.width * 0.5000000,
      size.height * 0.8999840,
    );
    path_1.cubicTo(
      size.width * 0.3916671,
      size.height * 0.8999840,
      size.width * 0.2933338,
      size.height * 0.8603840,
      size.width * 0.2191671,
      size.height * 0.7951840,
    );
    path_1.cubicTo(
      size.width * 0.2233337,
      size.height * 0.7575840,
      size.width * 0.2483337,
      size.height * 0.7207840,
      size.width * 0.2929171,
      size.height * 0.6919840,
    );
    path_1.cubicTo(
      size.width * 0.4070837,
      size.height * 0.6191840,
      size.width * 0.5937500,
      size.height * 0.6191840,
      size.width * 0.7070833,
      size.height * 0.6919840,
    );
    path_1.cubicTo(
      size.width * 0.7516667,
      size.height * 0.7207840,
      size.width * 0.7766667,
      size.height * 0.7575840,
      size.width * 0.7808333,
      size.height * 0.7951840,
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
    path_2.moveTo(size.width * 0.5000000, size.height * 0.9000000);
    path_2.cubicTo(
      size.width * 0.7301167,
      size.height * 0.9000000,
      size.width * 0.9166667,
      size.height * 0.7209120,
      size.width * 0.9166667,
      size.height * 0.5000000,
    );
    path_2.cubicTo(
      size.width * 0.9166667,
      size.height * 0.2790860,
      size.width * 0.7301167,
      size.height * 0.1000000,
      size.width * 0.5000000,
      size.height * 0.1000000,
    );
    path_2.cubicTo(
      size.width * 0.2698813,
      size.height * 0.1000000,
      size.width * 0.08333333,
      size.height * 0.2790860,
      size.width * 0.08333333,
      size.height * 0.5000000,
    );
    path_2.cubicTo(
      size.width * 0.08333333,
      size.height * 0.7209120,
      size.width * 0.2698813,
      size.height * 0.9000000,
      size.width * 0.5000000,
      size.height * 0.9000000,
    );
    path_2.close();

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
