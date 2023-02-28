import 'package:client/configs/configs.dart';
import 'package:client/router/router.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutteram',
      navigatorObservers: [
        NavigationHistoryObserver(),
      ],
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.dark, // TODO: Manage dynamic themes later
      initialRoute: AppRoutes.welcome,
      routes: appRoutes,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   User? user;

//   @override
//   void initState() {
//     super.initState();

//     http.get(Uri.parse('http://127.0.0.1:8080')).then((response) {
//       setState(() {
//         user = User.fromJson(jsonDecode(response.body));
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (user == null)
//               const CircularProgressIndicator()
//             else
//               Text(
//                 user!.username,
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
