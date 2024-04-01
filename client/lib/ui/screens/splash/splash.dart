import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/comment/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/cubits/story/cubit.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/animations/entrance_fader.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:client/utils/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '_listener.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _next() async {
    final authCubit = AuthCubit.c(context);
    authCubit.fetchAll();

    await 3.seconds.delay;

    final uid = AppCache.uid;
    if (uid != null) {
      await authCubit.fetch(uid);
      return;
    }

    if (!mounted) return;
    AppRoutes.welcome.pushReplace(context);
  }

  @override
  void initState() {
    super.initState();

    _next();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(
      overlayBuilders: const [_Listener()],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EntranceFader(
            offset: const Offset(0, 30),
            duration: const Duration(seconds: 1),
            child: FlutterLogo(
              size: 50.un(),
            ),
          ),
          Space.y.t30,
          Text(
            'Flutteram',
            style: AppText.h3,
          ),
          Space.y.t10,
          Text(
            "Let's socialize while fluttering",
            style: AppText.b3 + AppTheme.grey,
          )
        ],
      ),
    );
  }
}
