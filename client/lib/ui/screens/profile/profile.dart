import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/comment/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/cubits/story/cubit.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:client/ui/widgets/design/empty_results/empty_results.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

part 'widgets/_body.dart';
part 'widgets/_stats.dart';
part 'widgets/_following.dart';
part 'widgets/_followers.dart';
part 'widgets/_header.dart';
part 'widgets/_content_capsule.dart';

part '_state.dart';
part '_auth_listener.dart';
part '_follow_listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args: args),
      child: const _Body(),
    );
  }
}
