part of 'profile.dart';

enum ContentType {
  images,
  videos,
}

class _ScreenState extends ChangeNotifier {
  _ScreenState({Map<String, dynamic>? args}) {
    profile = args?['profile'] as User?;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  User? profile;

  ContentType _contentType = ContentType.images;
  ContentType get contentType => _contentType;

  void setType(ContentType type) {
    _contentType = type;
    notifyListeners();
  }
}
