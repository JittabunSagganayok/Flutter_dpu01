//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_profile01/flexpage.dart';
import 'package:my_profile01/login_page.dart';
import 'package:my_profile01/profilepage.dart';
import 'package:my_profile01/twitterclone.dart';
import 'package:my_profile01/stopwatch_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

void main() {
  //runApp(const MyApp());
  return runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class AppModule extends Module {
  //final String title=" ";
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage(title: 'Login')),
        ChildRoute('/stopwatchpage',
            child: (context, args) => Stopwatch(title: args.data)),
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routes: {
      //   '/': (context) => LoginPage(title: 'Login'),
      //   LoginPage.route: (context) => const LoginPage(title: 'Login'),
      //   Stopwatch.route: (context) => Stopwatch(
      //         title: 'sss',
      //       ),
      // },
      // initialRoute: '/',
      title: 'Profile App',
      //themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      //home: LoginPage(title: 'Login'),
      //home: Twitter(),
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
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
