import 'package:client/configs/configs.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:flutter/material.dart';

class UploadMediaModal extends StatelessWidget {
  final void Function() cameraCall;
  final void Function() galleryCall;
  final void Function()? removeCall;
  final String label;

  const UploadMediaModal({
    super.key,
    required this.label,
    required this.cameraCall,
    required this.galleryCall,
    this.removeCall,
  });

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
                label,
                style: AppText.b1,
              )
            ],
          ),
          Space.y.t30,
          AppButton(
            onPressed: cameraCall,
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
          ),
          Space.y.t25,
          AppButton(
            style: AppButtonStyle.dark,
            onPressed: galleryCall,
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
          ),
          if (removeCall != null) ...[
            Divider(
              height: 12.un(),
            ),
            AppButton(
              style: AppButtonStyle.danger,
              icon: Icons.delete_outline_rounded,
              label: 'Remove',
              onPressed: removeCall!,
            ),
          ],
          Space.y.t20,
          Space.bottom,
        ],
      ),
    );
  }
}
