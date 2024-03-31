import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/ui/widgets/design/post_card/post_card.dart';
import 'package:client/ui/widgets/design/post_card/widgets/header.dart';
import 'package:client/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'widgets/_body.dart';
part 'widgets/_header.dart';

part '_state.dart';
part '_delete_listener.dart';

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args: args),
      child: const _Body(),
    );
  }
}
