import 'package:client/configs/configs.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:flutter/material.dart';

class UploadMediaModal extends StatelessWidget {
  const UploadMediaModal({super.key});

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
                'Upload media',
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
                  'Camera',
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
                  painter: const GalleryIconPainter(),
                  size: GalleryIconPainter.s(10.un()),
                ),
                Space.x.t10,
                Text(
                  'Gallery',
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
