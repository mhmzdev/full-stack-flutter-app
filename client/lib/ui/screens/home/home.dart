import 'dart:ui';

import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:client/ui/widgets/design/empty_results/empty_results.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/ui/widgets/design/post_card/post_card.dart';
import 'package:client/utils/assets.dart';
import 'package:client/utils/snackbars.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

part 'widgets/_body.dart';
part 'widgets/_feed_capsule.dart';
part 'widgets/_create_story.dart';
part 'widgets/_story_card.dart';
part 'widgets/_header.dart';

part '_state.dart';
part '_delete_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
