import 'package:client/configs/configs.dart';
import 'package:client/firebase_options.dart';
import 'package:client/providers/media_provider.dart';
import 'package:client/router/router.dart';
import 'package:client/services/alice.dart';
import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:client/services/notification/notification.dart';
import 'package:client/ui/screens/home/home.dart';
import 'package:client/ui/screens/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

// bloc-imports-start
import 'cubits/comment/cubit.dart';
import 'cubits/story/cubit.dart';
import 'cubits/media/cubit.dart';
import 'cubits/post/cubit.dart';
import 'cubits/auth/cubit.dart';

// bloc-imports-end

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AppCache.init();
  AppAlice.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFCM.init(navigatorKey);
      AppFCM.onReceiveRemoteMessage();
    });
    if (kDebugMode) {
      AppAlice.setNavigatorKey(navigatorKey);
      Api.ins.interceptors.add(AppAlice.getDioInterceptor());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MediaProvider()),

        // bloc-initiate-start
        BlocProvider(create: (_) => CommentCubit()),
        BlocProvider(create: (_) => StoryCubit()),
        BlocProvider(create: (_) => MediaCubit()),
        BlocProvider(create: (_) => PostCubit()),
        BlocProvider(create: (_) => AuthCubit()),

        // bloc-initiate-end
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutteram',
        navigatorObservers: [
          NavigationHistoryObserver(),
        ],
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        themeMode: ThemeMode.dark,
        initialRoute: AppRoutes.splash,
        routes: appRoutes,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return FadeRoute(
                child: const HomeScreen(),
                settings: settings,
              );
            case AppRoutes.profile:
              return FadeRoute(
                child: const ProfileScreen(),
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
