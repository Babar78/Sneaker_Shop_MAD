// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:badges/badges.dart' as badges;

PreferredSize? customAppBarFav(ctx) {
  int lengthsOfItemsOnBag = itemsOnBag.length;
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text("Favorites",
          style: TextStyle(
              color: AppConstantsColor.darkTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
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
            Navigator.pushNamed(ctx, '/cart');
          },
        ),
      ],
    ),
  );
}
