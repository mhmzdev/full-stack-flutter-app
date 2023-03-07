part of 'edit_profile.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
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
    ''.pop(context, true);
    notifyListeners();
  }

  void reset() {
    xFile = null;
    notifyListeners();
  }
}
