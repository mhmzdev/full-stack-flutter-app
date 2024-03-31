import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/comment/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/cubits/story/cubit.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/ui/widgets/design/button/button.dart';
import 'package:client/ui/widgets/design/divider/divider_or.dart';
import 'package:client/ui/widgets/design/input/app_input_field.dart';
import 'package:client/ui/widgets/design/loader/full_screen_loader.dart';
import 'package:client/utils/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

part '_state.dart';
part '_auth_listener.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';
part 'widgets/_social_button.dart';
part 'widgets/_social_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
