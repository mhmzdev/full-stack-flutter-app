import 'package:client/configs/configs.dart';
import 'package:client/providers/media_provider.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UploadMediaModal extends StatelessWidget {
  final bool hasRemoval;
  final String label;

  const UploadMediaModal({
    super.key,
    required this.label,
    this.hasRemoval = false,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final media = MediaProvider.state(context, true);

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
            onPressed: () => media.camera(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            onPressed: () => media.gallery(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          if (hasRemoval) ...[
            Divider(
              height: 12.un(),
            ),
            AppButton(
              style: AppButtonStyle.danger,
              icon: Iconsax.trash,
              label: 'Remove',
              onPressed: () => media.remove(context),
            ),
          ],
          Space.bottom,
        ],
      ),
    );
  }
}
