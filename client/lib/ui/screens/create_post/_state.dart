part of 'create_post.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({Map<String, dynamic>? args}) {
    _post = args?['post'] as Post?;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
  
  Post? _post;
  Post? get post => _post;
}
