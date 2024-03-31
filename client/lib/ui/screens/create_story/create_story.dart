import 'dart:io';

import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/media/cubit.dart';
import 'package:client/cubits/story/cubit.dart';
import 'package:client/providers/media_provider.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/ui/widgets/design/modals/upload_media.dart';
import 'package:client/utils/snackbars.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';

part '_state.dart';
part '_media_listener.dart';
part '_story_listener.dart';

class CreateStoryScreen extends StatelessWidget {
  const CreateStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
