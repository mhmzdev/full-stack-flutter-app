part of 'post_view.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({
    required Map<String, dynamic> args,
  }) {
    _post = args['post'];
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  late Post _post;
  Post get post => _post;
}
