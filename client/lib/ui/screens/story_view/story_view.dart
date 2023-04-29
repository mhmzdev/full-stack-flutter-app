import 'package:client/configs/configs.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';

part '_state.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
