import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MediaProvider extends ChangeNotifier {
  static MediaProvider state(BuildContext context, [bool listen = false]) =>
      Provider.of<MediaProvider>(context, listen: listen);

  XFile? xFile;

  void camera(BuildContext context) async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.camera);

    if (xFile != null) {
      this.xFile = xFile;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ''.pop(context, true);
      });
      notifyListeners();
    }
  }

  void gallery(BuildContext context) async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      this.xFile = xFile;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ''.pop(context, true);
      });
      notifyListeners();
    }
  }

  void remove(BuildContext context) async {
    xFile = null;
    ''.pop(context, 'remove');
    notifyListeners();
  }

  void reset() {
    xFile = null;
    notifyListeners();
  }
}
