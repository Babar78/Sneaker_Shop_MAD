import 'package:flutter/material.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/models/models.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:sole_quest/view/explore_Items/widget/app_bar.dart';
import 'package:sole_quest/view/explore_Items/widget/body.dart';
import 'package:sole_quest/widget/snack_bar.dart';

class ExploreItemsScreen extends StatefulWidget {
  const ExploreItemsScreen({Key? key}) : super(key: key);

  @override
  State<ExploreItemsScreen> createState() => _ExploreItemsScreenState();
}

class _ExploreItemsScreenState extends State<ExploreItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: customAppBarExploreItems(context),
      body: ExploreItemsView(updateCart: addToCart),
    );
  }

  void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedAddToCartSnackBar());
    } else {
      setState(() {
        itemsOnBag.add(data);
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successAddToCartSnackBar());
    }
  }
}
