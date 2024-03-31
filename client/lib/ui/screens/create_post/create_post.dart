import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/media/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/providers/media_provider.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:client/ui/widgets/design/input/app_multiline_input.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/ui/widgets/design/modals/upload_media.dart';
import 'package:client/utils/snackbars.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared/shared.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';

part '_state.dart';
part '_edit_listener.dart';
part '_post_listener.dart';
part '_media_listener.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

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
