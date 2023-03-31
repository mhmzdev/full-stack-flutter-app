import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/static/posts.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:client/ui/widgets/design/empty_results/empty_results.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part 'widgets/_content_capsule.dart';

part '_state.dart';
part '_auth_listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
