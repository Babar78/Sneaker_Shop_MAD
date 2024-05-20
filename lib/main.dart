import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sole_quest/checkLoggedIn.dart';
import 'package:sole_quest/firebase_options.dart';
import 'package:sole_quest/view/checkout/checkout_screen.dart';
import 'package:sole_quest/view/login/login.dart';
import 'package:sole_quest/view/navigator.dart';
import 'package:sole_quest/view/signup/signup.dart';
import 'package:sole_quest/view/view.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that binding is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      title: 'SoleQuest',
      home: const CheckLoggedInUser(),
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/home': (context) => MainNavigator(),
        '/checkout': (context) => const Checkout(),
        '/cart': (context) => MyBagScreen(),
      },
    );
  }
}
