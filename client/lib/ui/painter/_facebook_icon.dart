part of 'base.dart';

class FacebookIconPainter extends CustomPainter {
  FacebookIconPainter({this.color});
  final Color? color;

  static Size size(num width) =>
      Size(width as double, (width * 0.96).toDouble());

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5073960, 0);
    path_0.cubicTo(
      size.width * 0.2353704,
      0,
      size.width * 0.01484376,
      size.height * 0.2247975,
      size.width * 0.01484376,
      size.height * 0.5020917,
    );
    path_0.cubicTo(
      size.width * 0.01484376,
      size.height * 0.7507958,
      size.width * 0.1924188,
      size.height * 0.9567625,
      size.width * 0.4252480,
      size.height * 0.9966458,
    );
    path_0.lineTo(size.width * 0.4252480, size.height * 0.6068417);
    path_0.lineTo(size.width * 0.3064308, size.height * 0.6068417);
    path_0.lineTo(size.width * 0.3064308, size.height * 0.4665708);
    path_0.lineTo(size.width * 0.4252480, size.height * 0.4665708);
    path_0.lineTo(size.width * 0.4252480, size.height * 0.3631371);
    path_0.cubicTo(
      size.width * 0.4252480,
      size.height * 0.2431254,
      size.width * 0.4971560,
      size.height * 0.1777263,
      size.width * 0.6021960,
      size.height * 0.1777263,
    );
    path_0.cubicTo(
      size.width * 0.6525040,
      size.height * 0.1777263,
      size.width * 0.6957360,
      size.height * 0.1815475,
      size.width * 0.7082880,
      size.height * 0.1832304,
    );
    path_0.lineTo(size.width * 0.7082880, size.height * 0.3086746);
    path_0.lineTo(size.width * 0.6354360, size.height * 0.3087104);
    path_0.cubicTo(
      size.width * 0.5783240,
      size.height * 0.3087104,
      size.width * 0.5673120,
      size.height * 0.3363700,
      size.width * 0.5673120,
      size.height * 0.3769729,
    );
    path_0.lineTo(size.width * 0.5673120, size.height * 0.4664958);
    path_0.lineTo(size.width * 0.7035880, size.height * 0.4664958);
    path_0.lineTo(size.width * 0.6858120, size.height * 0.6067708);
    path_0.lineTo(size.width * 0.5673120, size.height * 0.6067708);
    path_0.lineTo(size.width * 0.5673120, size.height);
    path_0.cubicTo(
      size.width * 0.8110120,
      size.height * 0.9697667,
      size.width * 0.9999440,
      size.height * 0.7585500,
      size.width * 0.9999440,
      size.height * 0.5019500,
    );
    path_0.cubicTo(
      size.width * 0.9999440,
      size.height * 0.2247975,
      size.width * 0.7794200,
      0,
      size.width * 0.5073960,
      0,
    );
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? Colors.white.withValues(alpha: 1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
