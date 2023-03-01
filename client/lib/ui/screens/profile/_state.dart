part of 'profile.dart';

enum ContentType {
  posts,
  videos,
}

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  ContentType _contentType = ContentType.posts;

  ContentType get contentType => _contentType;

  void setType(ContentType type) {
    _contentType = type;
    notifyListeners();
  }
}
