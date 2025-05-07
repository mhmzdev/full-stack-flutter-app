part of '../base.dart';

class HeartFilledIconPainter extends CustomPainter {
  const HeartFilledIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6850000, size.height * 0.1291708);
    path_0.cubicTo(
      size.width * 0.6095833,
      size.height * 0.1291708,
      size.width * 0.5420833,
      size.height * 0.1658375,
      size.width * 0.5000000,
      size.height * 0.2220875,
    );
    path_0.cubicTo(
      size.width * 0.4579167,
      size.height * 0.1658375,
      size.width * 0.3904167,
      size.height * 0.1291708,
      size.width * 0.3150000,
      size.height * 0.1291708,
    );
    path_0.cubicTo(
      size.width * 0.1870833,
      size.height * 0.1291708,
      size.width * 0.08333333,
      size.height * 0.2333375,
      size.width * 0.08333333,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.08333333,
      size.height * 0.4116708,
      size.width * 0.09125000,
      size.height * 0.4575042,
      size.width * 0.1050000,
      size.height * 0.5000042,
    );
    path_0.cubicTo(
      size.width * 0.1708333,
      size.height * 0.7083375,
      size.width * 0.3737500,
      size.height * 0.8329208,
      size.width * 0.4741667,
      size.height * 0.8670875,
    );
    path_0.cubicTo(
      size.width * 0.4883333,
      size.height * 0.8720875,
      size.width * 0.5116667,
      size.height * 0.8720875,
      size.width * 0.5258333,
      size.height * 0.8670875,
    );
    path_0.cubicTo(
      size.width * 0.6262500,
      size.height * 0.8329208,
      size.width * 0.8291667,
      size.height * 0.7083375,
      size.width * 0.8950000,
      size.height * 0.5000042,
    );
    path_0.cubicTo(
      size.width * 0.9087500,
      size.height * 0.4575042,
      size.width * 0.9166667,
      size.height * 0.4116708,
      size.width * 0.9166667,
      size.height * 0.3620875,
    );
    path_0.cubicTo(
      size.width * 0.9166667,
      size.height * 0.2333375,
      size.width * 0.8129167,
      size.height * 0.1291708,
      size.width * 0.6850000,
      size.height * 0.1291708,
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
