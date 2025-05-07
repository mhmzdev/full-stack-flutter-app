part of '../base.dart';

class HeartOutlineIconPainter extends CustomPainter {
  const HeartOutlineIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.9020875);
    path_0.cubicTo(
      size.width * 0.4870833,
      size.height * 0.9020875,
      size.width * 0.4745833,
      size.height * 0.9004208,
      size.width * 0.4641667,
      size.height * 0.8966708,
    );
    path_0.cubicTo(
      size.width * 0.3050000,
      size.height * 0.8420875,
      size.width * 0.05208333,
      size.height * 0.6483375,
      size.width * 0.05208333,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.05208333,
      size.height * 0.2162542,
      size.width * 0.1700000,
      size.height * 0.09792083,
      size.width * 0.3150000,
      size.height * 0.09792083,
    );
    path_0.cubicTo(
      size.width * 0.3854167,
      size.height * 0.09792083,
      size.width * 0.4512500,
      size.height * 0.1254208,
      size.width * 0.5000000,
      size.height * 0.1745875,
    );
    path_0.cubicTo(
      size.width * 0.5487500,
      size.height * 0.1254208,
      size.width * 0.6145833,
      size.height * 0.09792083,
      size.width * 0.6850000,
      size.height * 0.09792083,
    );
    path_0.cubicTo(
      size.width * 0.8300000,
      size.height * 0.09792083,
      size.width * 0.9479167,
      size.height * 0.2166708,
      size.width * 0.9479167,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.9479167,
      size.height * 0.6487542,
      size.width * 0.6950000,
      size.height * 0.8420875,
      size.width * 0.5358333,
      size.height * 0.8966708,
    );
    path_0.cubicTo(
      size.width * 0.5254167,
      size.height * 0.9004208,
      size.width * 0.5129167,
      size.height * 0.9020875,
      size.width * 0.5000000,
      size.height * 0.9020875,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.3150000, size.height * 0.1604208);
    path_0.cubicTo(
      size.width * 0.2045833,
      size.height * 0.1604208,
      size.width * 0.1145833,
      size.height * 0.2508375,
      size.width * 0.1145833,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.1145833,
      size.height * 0.6466708,
      size.width * 0.3883333,
      size.height * 0.8050042,
      size.width * 0.4845833,
      size.height * 0.8379208,
    );
    path_0.cubicTo(
      size.width * 0.4920833,
      size.height * 0.8404208,
      size.width * 0.5083333,
      size.height * 0.8404208,
      size.width * 0.5158333,
      size.height * 0.8379208,
    );
    path_0.cubicTo(
      size.width * 0.6116667,
      size.height * 0.8050042,
      size.width * 0.8858333,
      size.height * 0.6470875,
      size.width * 0.8858333,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.8858333,
      size.height * 0.2508375,
      size.width * 0.7958333,
      size.height * 0.1604208,
      size.width * 0.6854167,
      size.height * 0.1604208,
    );
    path_0.cubicTo(
      size.width * 0.6220833,
      size.height * 0.1604208,
      size.width * 0.5633333,
      size.height * 0.1900042,
      size.width * 0.5254167,
      size.height * 0.2412542,
    );
    path_0.cubicTo(
      size.width * 0.5137500,
      size.height * 0.2570875,
      size.width * 0.4870833,
      size.height * 0.2570875,
      size.width * 0.4754167,
      size.height * 0.2412542,
    );
    path_0.cubicTo(
      size.width * 0.4366667,
      size.height * 0.1895875,
      size.width * 0.3783333,
      size.height * 0.1604208,
      size.width * 0.3150000,
      size.height * 0.1604208,
    );
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? const Color(0xff292D32).withValues(alpha: 1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
