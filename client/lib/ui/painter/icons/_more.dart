part of '../base.dart';

class MoreIconPainter extends CustomPainter {
  const MoreIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2200000, size.height * 0.4200000);
    path_0.cubicTo(
      size.width * 0.1760000,
      size.height * 0.4200000,
      size.width * 0.1400000,
      size.height * 0.4560000,
      size.width * 0.1400000,
      size.height * 0.5000000,
    );
    path_0.cubicTo(
      size.width * 0.1400000,
      size.height * 0.5440000,
      size.width * 0.1760000,
      size.height * 0.5800000,
      size.width * 0.2200000,
      size.height * 0.5800000,
    );
    path_0.cubicTo(
      size.width * 0.2640000,
      size.height * 0.5800000,
      size.width * 0.3000000,
      size.height * 0.5440000,
      size.width * 0.3000000,
      size.height * 0.5000000,
    );
    path_0.cubicTo(
      size.width * 0.3000000,
      size.height * 0.4560000,
      size.width * 0.2640000,
      size.height * 0.4200000,
      size.width * 0.2200000,
      size.height * 0.4200000,
    );
    path_0.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint0Stroke.color = const Color(0xffAAACAB).withValues(alpha: 1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7800000, size.height * 0.4200000);
    path_1.cubicTo(
      size.width * 0.7360000,
      size.height * 0.4200000,
      size.width * 0.7000000,
      size.height * 0.4560000,
      size.width * 0.7000000,
      size.height * 0.5000000,
    );
    path_1.cubicTo(
      size.width * 0.7000000,
      size.height * 0.5440000,
      size.width * 0.7360000,
      size.height * 0.5800000,
      size.width * 0.7800000,
      size.height * 0.5800000,
    );
    path_1.cubicTo(
      size.width * 0.8240000,
      size.height * 0.5800000,
      size.width * 0.8600000,
      size.height * 0.5440000,
      size.width * 0.8600000,
      size.height * 0.5000000,
    );
    path_1.cubicTo(
      size.width * 0.8600000,
      size.height * 0.4560000,
      size.width * 0.8240000,
      size.height * 0.4200000,
      size.width * 0.7800000,
      size.height * 0.4200000,
    );
    path_1.close();

    Paint paint1Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint1Stroke.color = const Color(0xffAAACAB).withValues(alpha: 1.0);
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.4200000);
    path_2.cubicTo(
      size.width * 0.4560000,
      size.height * 0.4200000,
      size.width * 0.4200000,
      size.height * 0.4560000,
      size.width * 0.4200000,
      size.height * 0.5000000,
    );
    path_2.cubicTo(
      size.width * 0.4200000,
      size.height * 0.5440000,
      size.width * 0.4560000,
      size.height * 0.5800000,
      size.width * 0.5000000,
      size.height * 0.5800000,
    );
    path_2.cubicTo(
      size.width * 0.5440000,
      size.height * 0.5800000,
      size.width * 0.5800000,
      size.height * 0.5440000,
      size.width * 0.5800000,
      size.height * 0.5000000,
    );
    path_2.cubicTo(
      size.width * 0.5800000,
      size.height * 0.4560000,
      size.width * 0.5440000,
      size.height * 0.4200000,
      size.width * 0.5000000,
      size.height * 0.4200000,
    );
    path_2.close();

    Paint paint2Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.06000000;
    paint2Stroke.color = const Color(0xffAAACAB).withValues(alpha: 1.0);
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
