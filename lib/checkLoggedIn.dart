import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sole_quest/view/login/login.dart';
import 'package:sole_quest/view/navigator.dart';

class CheckLoggedInUser extends StatefulWidget {
  const CheckLoggedInUser({Key? key}) : super(key: key);

  @override
  State<CheckLoggedInUser> createState() => _CheckLoggedInUserState();
}

class _CheckLoggedInUserState extends State<CheckLoggedInUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }

  checkuser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MainNavigator();
    } else {
      return Login();
    }
  }
}
