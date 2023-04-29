part of 'story_view.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({
    required Map<String, dynamic> args,
  }) {
    stories = args['stories'] as List<Story>;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  late List<Story> stories;
  int current = 0;

  void next(BuildContext context) {
    if (current < stories.length - 1) {
      current++;
      cancelTimer();
      startTimer(context);
    } else {
      ''.pop(context);
      cancelTimer();
      return;
    }
    notifyListeners();
  }

  void prev(BuildContext context) {
    if (current > 0) {
      current--;
      cancelTimer();
      startTimer(context);
    } else {
      ''.pop(context);
      cancelTimer();
      return;
    }
    notifyListeners();
  }

  Timer? timer;
  int duration = 0;
  bool timerActive = false;

  void startTimer(BuildContext context) {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    final milli = 1.milliseconds;
    timer = Timer.periodic(
      milli,
      (storyTimer) {
        timerActive = true;

        if (duration == 15000) {
          duration = 0;
          next(context);
          notifyListeners();
        } else {
          duration++;
          notifyListeners();
        }
      },
    );

    notifyListeners();
  }

  void cancelTimer() {
    if (timer != null) {
      duration = 0;
      timer!.cancel();
      timerActive = false;
      notifyListeners();
    }
  }
}
