// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/utils/constants.dart';

import 'package:sole_quest/view/bag/widget/body.dart';

class MyBagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Cart",
            style: TextStyle(
              color: AppConstantsColor.darkTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: const BodyBagView(),
    );
  }
}
