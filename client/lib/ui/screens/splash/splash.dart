import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/services/cache.dart';
import 'package:client/ui/animations/entrance_fader.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _next() async {
    final authCubit = AuthCubit.c(context);
    await 3.seconds.delay;
    if (!mounted) return;

    final uid = Cache.uid;
    if (uid != null) {
      await authCubit.fetch(uid);

      if (!mounted) return;
      AppRoutes.home.pushReplace(context);
      return;
    }
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
