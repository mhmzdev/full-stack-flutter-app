part of 'create_post.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Map<String, dynamic> args}) {
    _post = args['post'] as Post?;
    source = args['source'] as String? ?? AppRoutes.home;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  late String source;

  Post? _post;
  Post? get post => _post;
}
