import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sole_quest/animation/fadeanimation.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/models/models.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/utils/app_methods.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:sole_quest/view/favourites/widget/app_bar.dart';
import 'package:sole_quest/view/favourites/widget/body.dart';
import 'package:sole_quest/view/view.dart';
import 'package:sole_quest/widget/snack_bar.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarFav(context),
        body: const FavouritesView());
  }
}
