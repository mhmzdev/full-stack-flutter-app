import 'package:client/ui/screens/comment/comment.dart';
import 'package:client/ui/screens/story_view/story_view.dart';
import 'package:client/ui/screens/post_view/post_view.dart';
import 'package:client/ui/screens/inbox/inbox.dart';
import 'package:client/ui/screens/chat/chat.dart';
import 'package:client/ui/screens/edit_profile/edit_profile.dart';
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
  AppRoutes.comment: (_) => const CommentScreen(),
  AppRoutes.storyView: (_) => const StoryViewScreen(),
  AppRoutes.postView: (_) => const PostViewScreen(),
  AppRoutes.inbox: (_) => const InboxScreen(),
  AppRoutes.chat: (_) => const ChatScreen(),
  AppRoutes.editProfile: (_) => const EditProfileScreen(),
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
