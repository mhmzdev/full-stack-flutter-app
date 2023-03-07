part of '../base.dart';

class GalleryIconPainter extends CustomPainter {
  const GalleryIconPainter({this.color});
  final Color? color;

  static Size s(double w) => Size(w, w);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3749971, size.height * 0.9166559);
    path_0.lineTo(size.width * 0.6249971, size.height * 0.9166559);
    path_0.cubicTo(
        size.width * 0.8333324,
        size.height * 0.9166559,
        size.width * 0.9166647,
        size.height * 0.8333235,
        size.width * 0.9166647,
        size.height * 0.6249912);
    path_0.lineTo(size.width * 0.9166647, size.height * 0.3749912);
    path_0.cubicTo(
        size.width * 0.9166647,
        size.height * 0.1666571,
        size.width * 0.8333324,
        size.height * 0.08332382,
        size.width * 0.6249971,
        size.height * 0.08332382);
    path_0.lineTo(size.width * 0.3749971, size.height * 0.08332382);
    path_0.cubicTo(
        size.width * 0.1666644,
        size.height * 0.08332382,
        size.width * 0.08333088,
        size.height * 0.1666571,
        size.width * 0.08333088,
        size.height * 0.3749912);
    path_0.lineTo(size.width * 0.08333088, size.height * 0.6249912);
    path_0.cubicTo(
        size.width * 0.08333088,
        size.height * 0.8333235,
        size.width * 0.1666644,
        size.height * 0.9166559,
        size.width * 0.3749971,
        size.height * 0.9166559);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04411765;
    paint0Stroke.color = Colors.white;
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3750029, size.height * 0.4166676);
    path_1.cubicTo(
        size.width * 0.4210265,
        size.height * 0.4166676,
        size.width * 0.4583353,
        size.height * 0.3793559,
        size.width * 0.4583353,
        size.height * 0.3333324);
    path_1.cubicTo(
        size.width * 0.4583353,
        size.height * 0.2873097,
        size.width * 0.4210265,
        size.height * 0.2500000,
        size.width * 0.3750029,
        size.height * 0.2500000);
    path_1.cubicTo(
        size.width * 0.3289794,
        size.height * 0.2500000,
        size.width * 0.2916691,
        size.height * 0.2873097,
        size.width * 0.2916691,
        size.height * 0.3333324);
    path_1.cubicTo(
        size.width * 0.2916691,
        size.height * 0.3793559,
        size.width * 0.3289794,
        size.height * 0.4166676,
        size.width * 0.3750029,
        size.height * 0.4166676);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04411765;
    paint1Stroke.color = Colors.white;
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.1112491, size.height * 0.7895735);
    path_2.lineTo(size.width * 0.3166647, size.height * 0.6516559);
    path_2.cubicTo(
        size.width * 0.3495824,
        size.height * 0.6295735,
        size.width * 0.3970824,
        size.height * 0.6320735,
        size.width * 0.4266647,
        size.height * 0.6574882);
    path_2.lineTo(size.width * 0.4404147, size.height * 0.6695735);
    path_2.cubicTo(
        size.width * 0.4729147,
        size.height * 0.6974882,
        size.width * 0.5254147,
        size.height * 0.6974882,
        size.width * 0.5579147,
        size.height * 0.6695735);
    path_2.lineTo(size.width * 0.7312500, size.height * 0.5208235);
    path_2.cubicTo(
        size.width * 0.7637500,
        size.height * 0.4929059,
        size.width * 0.8162500,
        size.height * 0.4929059,
        size.width * 0.8487500,
        size.height * 0.5208235);
    path_2.lineTo(size.width * 0.9166647, size.height * 0.5791559);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04411765;
    paint2Stroke.color = Colors.white;
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
