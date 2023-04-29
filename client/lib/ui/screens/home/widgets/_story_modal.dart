part of '../home.dart';

class _StoryModal extends StatelessWidget {
  const _StoryModal();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.a.t25,
      decoration: AppProps.modalDec,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const AppBackButton(),
              Space.x.t15,
              Text(
                'Where to...?',
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
                  'Create Story',
                  style: AppText.b1,
                )
              ],
            ),
            onPressed: () {
              ''.pop(context);
              AppRoutes.createStory.push(context);
            },
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
                  'View Story',
                  style: AppText.b1,
                )
              ],
            ),
            onPressed: () => ''.pop(context, true),
          ),
          Space.bottom,
        ],
      ),
    );
  }
}
