part of '../base.dart';

class HomeFilledIconPainter extends CustomPainter {
  const HomeFilledIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8350083, size.height * 0.2841642);
    path_0.lineTo(size.width * 0.5950083, size.height * 0.1162475);
    path_0.cubicTo(
      size.width * 0.5295917,
      size.height * 0.07041417,
      size.width * 0.4291750,
      size.height * 0.07291417,
      size.width * 0.3662596,
      size.height * 0.1216642,
    );
    path_0.lineTo(size.width * 0.1575096, size.height * 0.2845808);
    path_0.cubicTo(
      size.width * 0.1158429,
      size.height * 0.3170808,
      size.width * 0.08292625,
      size.height * 0.3837475,
      size.width * 0.08292625,
      size.height * 0.4362458,
    );
    path_0.lineTo(size.width * 0.08292625, size.height * 0.7237458);
    path_0.cubicTo(
      size.width * 0.08292625,
      size.height * 0.8299958,
      size.width * 0.1691763,
      size.height * 0.9166625,
      size.width * 0.2754262,
      size.height * 0.9166625,
    );
    path_0.lineTo(size.width * 0.7245917, size.height * 0.9166625);
    path_0.cubicTo(
      size.width * 0.8308417,
      size.height * 0.9166625,
      size.width * 0.9170917,
      size.height * 0.8304125,
      size.width * 0.9170917,
      size.height * 0.7241625,
    );
    path_0.lineTo(size.width * 0.9170917, size.height * 0.4416625);
    path_0.cubicTo(
      size.width * 0.9170917,
      size.height * 0.3854142,
      size.width * 0.8808417,
      size.height * 0.3162475,
      size.width * 0.8350083,
      size.height * 0.2841642,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.5312583, size.height * 0.7499958);
    path_0.cubicTo(
      size.width * 0.5312583,
      size.height * 0.7670792,
      size.width * 0.5170917,
      size.height * 0.7812458,
      size.width * 0.5000083,
      size.height * 0.7812458,
    );
    path_0.cubicTo(
      size.width * 0.4829250,
      size.height * 0.7812458,
      size.width * 0.4687583,
      size.height * 0.7670792,
      size.width * 0.4687583,
      size.height * 0.7499958,
    );
    path_0.lineTo(size.width * 0.4687583, size.height * 0.6249958);
    path_0.cubicTo(
      size.width * 0.4687583,
      size.height * 0.6079125,
      size.width * 0.4829250,
      size.height * 0.5937458,
      size.width * 0.5000083,
      size.height * 0.5937458,
    );
    path_0.cubicTo(
      size.width * 0.5170917,
      size.height * 0.5937458,
      size.width * 0.5312583,
      size.height * 0.6079125,
      size.width * 0.5312583,
      size.height * 0.6249958,
    );
    path_0.lineTo(size.width * 0.5312583, size.height * 0.7499958);
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
