import 'package:client/ui/screens/create_story/create_story.dart';
import 'package:client/ui/screens/create_post/create_post.dart';
import 'package:client/ui/screens/forgot/forgot.dart';
import 'package:client/ui/screens/register/register.dart';
import 'package:client/ui/screens/login/login.dart';
import 'package:client/ui/screens/welcome/welcome.dart';
import 'package:client/router/routes.dart';
import 'package:client/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';

final appRoutes = {
  AppRoutes.createStory: (_) => const CreateStoryScreen(),
  AppRoutes.createPost: (_) => const CreatePostScreen(),
  AppRoutes.forgot: (_) => const ForgotScreen(),
  AppRoutes.register: (_) => const RegisterScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.welcome: (_) => const WelcomeScreen(),
  AppRoutes.splash: (_) => const SplashScreen(),
};

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) {
            return FadeTransition(
              opacity: ani1,
              child: child,
            );
          },
        );
}
