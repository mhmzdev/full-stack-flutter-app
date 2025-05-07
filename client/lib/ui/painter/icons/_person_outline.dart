part of '../base.dart';

class PersonOutlineIconPainter extends CustomPainter {
  const PersonOutlineIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5066708, size.height * 0.4529167);
    path_0.cubicTo(
      size.width * 0.5025042,
      size.height * 0.4525000,
      size.width * 0.4975042,
      size.height * 0.4525000,
      size.width * 0.4929208,
      size.height * 0.4529167,
    );
    path_0.cubicTo(
      size.width * 0.3937525,
      size.height * 0.4495833,
      size.width * 0.3150025,
      size.height * 0.3683333,
      size.width * 0.3150025,
      size.height * 0.2683333,
    );
    path_0.cubicTo(
      size.width * 0.3150025,
      size.height * 0.1662500,
      size.width * 0.3975025,
      size.height * 0.08333333,
      size.width * 0.5000042,
      size.height * 0.08333333,
    );
    path_0.cubicTo(
      size.width * 0.6020875,
      size.height * 0.08333333,
      size.width * 0.6850042,
      size.height * 0.1662500,
      size.width * 0.6850042,
      size.height * 0.2683333,
    );
    path_0.cubicTo(
      size.width * 0.6845875,
      size.height * 0.3683333,
      size.width * 0.6058375,
      size.height * 0.4495833,
      size.width * 0.5066708,
      size.height * 0.4529167,
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
    path_1.moveTo(size.width * 0.2983321, size.height * 0.6066667);
    path_1.cubicTo(
      size.width * 0.1974987,
      size.height * 0.6741667,
      size.width * 0.1974987,
      size.height * 0.7841667,
      size.width * 0.2983321,
      size.height * 0.8512500,
    );
    path_1.cubicTo(
      size.width * 0.4129154,
      size.height * 0.9279167,
      size.width * 0.6008333,
      size.height * 0.9279167,
      size.width * 0.7154167,
      size.height * 0.8512500,
    );
    path_1.cubicTo(
      size.width * 0.8162500,
      size.height * 0.7837500,
      size.width * 0.8162500,
      size.height * 0.6737500,
      size.width * 0.7154167,
      size.height * 0.6066667,
    );
    path_1.cubicTo(
      size.width * 0.6012500,
      size.height * 0.5304167,
      size.width * 0.4133321,
      size.height * 0.5304167,
      size.width * 0.2983321,
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
