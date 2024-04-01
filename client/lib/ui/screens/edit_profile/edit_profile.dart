import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/media/cubit.dart';
import 'package:client/providers/media_provider.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/buttons/app_back_button.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:client/ui/widgets/design/input/app_date_time_input.dart';
import 'package:client/ui/widgets/design/input/app_input_field.dart';
import 'package:client/ui/widgets/design/input/app_multiline_input.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/ui/widgets/design/modals/upload_media.dart';
import 'package:client/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:client/utils/snackbars.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

part '_listener.dart';
part '_dp_listener.dart';
part '_cover_listener.dart';
part '_media_listener.dart';

part '_state.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';
part 'widgets/_cover_photo.dart';
part 'widgets/_profile_photo.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
