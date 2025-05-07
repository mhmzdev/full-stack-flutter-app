part of '../base.dart';

class PersonBrokenIconPainter extends CustomPainter {
  const PersonBrokenIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6533333, size.height * 0.1650000);
    path_0.cubicTo(
      size.width * 0.6733333,
      size.height * 0.1945833,
      size.width * 0.6850000,
      size.height * 0.2300000,
      size.width * 0.6850000,
      size.height * 0.2683333,
    );
    path_0.cubicTo(
      size.width * 0.6845833,
      size.height * 0.3683333,
      size.width * 0.6058333,
      size.height * 0.4495833,
      size.width * 0.5066667,
      size.height * 0.4529167,
    );
    path_0.cubicTo(
      size.width * 0.5025000,
      size.height * 0.4525000,
      size.width * 0.4975000,
      size.height * 0.4525000,
      size.width * 0.4929167,
      size.height * 0.4529167,
    );
    path_0.cubicTo(
      size.width * 0.4008317,
      size.height * 0.4500000,
      size.width * 0.3262483,
      size.height * 0.3795833,
      size.width * 0.3162483,
      size.height * 0.2895833,
    );
    path_0.cubicTo(
      size.width * 0.3041650,
      size.height * 0.1825000,
      size.width * 0.3920817,
      size.height * 0.08333333,
      size.width * 0.4995833,
      size.height * 0.08333333,
    );

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
    path_1.moveTo(size.width * 0.2912521, size.height * 0.6066667);
    path_1.cubicTo(
      size.width * 0.1904187,
      size.height * 0.6741667,
      size.width * 0.1904187,
      size.height * 0.7841667,
      size.width * 0.2912521,
      size.height * 0.8512500,
    );
    path_1.cubicTo(
      size.width * 0.4058354,
      size.height * 0.9279167,
      size.width * 0.5937500,
      size.height * 0.9279167,
      size.width * 0.7083333,
      size.height * 0.8512500,
    );
    path_1.cubicTo(
      size.width * 0.8091667,
      size.height * 0.7837500,
      size.width * 0.8091667,
      size.height * 0.6737500,
      size.width * 0.7083333,
      size.height * 0.6066667,
    );
    path_1.cubicTo(
      size.width * 0.5945833,
      size.height * 0.5304167,
      size.width * 0.4066687,
      size.height * 0.5304167,
      size.width * 0.2912521,
      size.height * 0.6066667,
    );
    path_1.close();

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
