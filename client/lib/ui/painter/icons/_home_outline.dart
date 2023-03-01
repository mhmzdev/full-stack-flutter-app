part of '../base.dart';

class HomeOutlineIconPainter extends CustomPainter {
  const HomeOutlineIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7412500, size.height * 0.9479167);
    path_0.lineTo(size.width * 0.2587500, size.height * 0.9479167);
    path_0.cubicTo(
        size.width * 0.1445833,
        size.height * 0.9479167,
        size.width * 0.05208333,
        size.height * 0.8550000,
        size.width * 0.05208333,
        size.height * 0.7408333);
    path_0.lineTo(size.width * 0.05208333, size.height * 0.4320833);
    path_0.cubicTo(
        size.width * 0.05208333,
        size.height * 0.3754154,
        size.width * 0.08708333,
        size.height * 0.3041654,
        size.width * 0.1320833,
        size.height * 0.2691654);
    path_0.lineTo(size.width * 0.3566667, size.height * 0.09416542);
    path_0.cubicTo(
        size.width * 0.4241667,
        size.height * 0.04166558,
        size.width * 0.5320833,
        size.height * 0.03916558,
        size.width * 0.6020833,
        size.height * 0.08833208);
    path_0.lineTo(size.width * 0.8595833, size.height * 0.2687488);
    path_0.cubicTo(
        size.width * 0.9091667,
        size.height * 0.3033321,
        size.width * 0.9479167,
        size.height * 0.3774987,
        size.width * 0.9479167,
        size.height * 0.4379167);
    path_0.lineTo(size.width * 0.9479167, size.height * 0.7412500);
    path_0.cubicTo(
        size.width * 0.9479167,
        size.height * 0.8550000,
        size.width * 0.8554167,
        size.height * 0.9479167,
        size.width * 0.7412500,
        size.height * 0.9479167);
    path_0.close();
    path_0.moveTo(size.width * 0.3950000, size.height * 0.1433321);
    path_0.lineTo(size.width * 0.1704167, size.height * 0.3183321);
    path_0.cubicTo(
        size.width * 0.1408333,
        size.height * 0.3416654,
        size.width * 0.1145833,
        size.height * 0.3945821,
        size.width * 0.1145833,
        size.height * 0.4320833);
    path_0.lineTo(size.width * 0.1145833, size.height * 0.7408333);
    path_0.cubicTo(
        size.width * 0.1145833,
        size.height * 0.8204167,
        size.width * 0.1791667,
        size.height * 0.8854167,
        size.width * 0.2587500,
        size.height * 0.8854167);
    path_0.lineTo(size.width * 0.7412500, size.height * 0.8854167);
    path_0.cubicTo(
        size.width * 0.8208333,
        size.height * 0.8854167,
        size.width * 0.8854167,
        size.height * 0.8208333,
        size.width * 0.8854167,
        size.height * 0.7412500);
    path_0.lineTo(size.width * 0.8854167, size.height * 0.4379167);
    path_0.cubicTo(
        size.width * 0.8854167,
        size.height * 0.3979154,
        size.width * 0.8566667,
        size.height * 0.3424988,
        size.width * 0.8237500,
        size.height * 0.3199987);
    path_0.lineTo(size.width * 0.5662500, size.height * 0.1395821);
    path_0.cubicTo(
        size.width * 0.5187500,
        size.height * 0.1062488,
        size.width * 0.4404167,
        size.height * 0.1079154,
        size.width * 0.3950000,
        size.height * 0.1433321);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppTheme.grey;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.7812500);
    path_1.cubicTo(
        size.width * 0.4829167,
        size.height * 0.7812500,
        size.width * 0.4687500,
        size.height * 0.7670833,
        size.width * 0.4687500,
        size.height * 0.7500000);
    path_1.lineTo(size.width * 0.4687500, size.height * 0.6250000);
    path_1.cubicTo(
        size.width * 0.4687500,
        size.height * 0.6079167,
        size.width * 0.4829167,
        size.height * 0.5937500,
        size.width * 0.5000000,
        size.height * 0.5937500);
    path_1.cubicTo(
        size.width * 0.5170833,
        size.height * 0.5937500,
        size.width * 0.5312500,
        size.height * 0.6079167,
        size.width * 0.5312500,
        size.height * 0.6250000);
    path_1.lineTo(size.width * 0.5312500, size.height * 0.7500000);
    path_1.cubicTo(
        size.width * 0.5312500,
        size.height * 0.7670833,
        size.width * 0.5170833,
        size.height * 0.7812500,
        size.width * 0.5000000,
        size.height * 0.7812500);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = AppTheme.grey;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
