import 'package:client/configs/configs.dart';
import 'package:client/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 50.un(),
          ),
          Space.y.s30,
          Text(
            'Flutteram',
            style: AppText.h3,
          ),
          Space.y.s10,
          Text(
            "Let's socialize while fluttering",
            style: AppText.b3 + AppTheme.grey,
          )
        ],
      ),
    );
  }
}
