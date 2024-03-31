import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/story/cubit.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/utils/assets.dart';
import 'package:client/utils/snackbars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

part 'widgets/_body.dart';
part 'widgets/_header.dart';

part '_state.dart';
part '_delete_listener.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args: args),
      child: const _Body(),
    );
  }
}
