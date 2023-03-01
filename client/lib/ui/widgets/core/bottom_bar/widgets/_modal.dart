part of '../bottom_bar.dart';

class _Modal extends StatelessWidget {
  const _Modal();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.a.t25,
      decoration: BoxDecoration(
        color: AppTheme.backgroundDark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(6.un()),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const AppBackButton(),
              Space.x.t15,
              Text(
                'Post',
                style: AppText.b1,
              )
            ],
          ),
          Space.y.t30,
          AppButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPaint(
                  painter: const CameraIconPainter(),
                  size: CameraIconPainter.s(10.un()),
                ),
                Space.x.t10,
                Text(
                  'Create Post',
                  style: AppText.b1,
                )
              ],
            ),
            onPressed: () {},
          ),
          Space.y.t25,
          AppButton(
            style: AppButtonStyle.dark,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPaint(
                  painter: const PersonCircleIconPainter(),
                  size: PersonCircleIconPainter.s(10.un()),
                ),
                Space.x.t10,
                Text(
                  'Create Story',
                  style: AppText.b1,
                )
              ],
            ),
            onPressed: () {},
          ),
          Space.bottom,
        ],
      ),
    );
  }
}
