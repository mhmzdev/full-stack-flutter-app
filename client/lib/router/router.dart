import 'package:client/ui/screens/welcome/welcome.dart';
import 'package:client/router/routes.dart';
import 'package:client/ui/screens/splash/splash.dart';

final appRoutes = {
  AppRoutes.welcome: (_) => const WelcomeScreen(),
  AppRoutes.splash: (_) => const SplashScreen(),
};
