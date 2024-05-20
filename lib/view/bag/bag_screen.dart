// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/utils/constants.dart';

import 'package:sole_quest/view/bag/widget/body.dart';

class MyBagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Cart",
              style: TextStyle(
                color: AppConstantsColor.darkTextColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
        ),
        body: const BodyBagView(),
      ),
    );
  }
}
