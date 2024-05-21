import 'package:flutter/material.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:sole_quest/view/explore_Items/widget/app_bar.dart';
import 'package:sole_quest/view/explore_Items/widget/body.dart';

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
      body: const ExploreItemsView(),
    );
  }
}
