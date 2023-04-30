part of 'comment.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Map<String, dynamic> args}) {
    post = args['post'] as Post;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  late Post post;
}
