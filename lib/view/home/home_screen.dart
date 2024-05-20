import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';

import '../../../utils/constants.dart';
import 'components/body.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lengthsOfItemsOnBag = itemsOnBag.length;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Discover", style: AppThemes.homeAppBar),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: const FaIcon(
                  CupertinoIcons.search,
                  color: AppConstantsColor.darkTextColor,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 4),
              child: IconButton(
                icon: badges.Badge(
                  badgeContent: Text(
                    lengthsOfItemsOnBag.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const FaIcon(
                    CupertinoIcons.bag_fill,
                    color: AppConstantsColor.darkTextColor,
                    size: 25,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
          ],
        ),
        body: const Body(),
      ),
    );
  }
}
