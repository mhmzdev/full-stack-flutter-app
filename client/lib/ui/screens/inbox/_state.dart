part of 'inbox.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState(Map<String, dynamic> args) {
    user = args['user'];
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
  final controller = ScrollController();

  late User user;
  String? _message;

  // This List<ChatBubble> is temp use, real usecase doesn't have List<Widget>
  List<_ChatBubble> chats = [];

  String? get message => _message;

  void onMessageChange(String value) {
    _message = value;
    notifyListeners();
  }

  void setMessageInChat(String message, {bool? isLoggedIn}) {
    chats.add(
      _ChatBubble(
        isLoggedIn: isLoggedIn ?? true,
        message: message,
      ),
    );
    notifyListeners();
  }

  void onSubmit() {
    final form = formKey.currentState!;
    form.saveAndValidate();

    final message = form.value[_FormKeys.message] as String;
    setMessageInChat(message, isLoggedIn: false);
    onMessageChange('');

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: 400.milliseconds,
        curve: Curves.ease,
      );
    });
    formKey.currentState!.reset();
  }
}
