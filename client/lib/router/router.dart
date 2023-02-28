import 'package:client/ui/screens/profile/profile.dart';
import 'package:client/ui/screens/home/home.dart';
import 'package:client/ui/screens/forgot/forgot.dart';
import 'package:client/ui/screens/register/register.dart';
import 'package:client/ui/screens/login/login.dart';
import 'package:client/ui/screens/welcome/welcome.dart';
import 'package:client/router/routes.dart';
import 'package:client/ui/screens/splash/splash.dart';

final appRoutes = {
  AppRoutes.profile: (_) => const ProfileScreen(),
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.forgot: (_) => const ForgotScreen(),
  AppRoutes.register: (_) => const RegisterScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.welcome: (_) => const WelcomeScreen(),
  AppRoutes.splash: (_) => const SplashScreen(),
};
