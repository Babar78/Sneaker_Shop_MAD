// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';

import '../../../utils/constants.dart';
import 'package:badges/badges.dart' as badges;

PreferredSize? customAppBar() {
  int lengthsOfItemsOnBag = itemsOnBag.length;
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text("Discover", style: AppThemes.homeAppBar),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: FaIcon(
              CupertinoIcons.search,
              color: AppConstantsColor.darkTextColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, right: 4),
          child: IconButton(
            icon: badges.Badge(
              badgeContent: Text(
                lengthsOfItemsOnBag.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: FaIcon(
                CupertinoIcons.bag_fill,
                color: AppConstantsColor.darkTextColor,
                size: 25,
              ),
            ),
            onPressed: () {
              // Navigator.pushNamed(context, '/cart');
            },
          ),
        ),
      ],
    ),
  );
}
