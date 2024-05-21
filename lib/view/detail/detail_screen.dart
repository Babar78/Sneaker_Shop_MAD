import 'package:flutter/material.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/models/shoe_model.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/view/detail/components/body.dart';
import 'package:sole_quest/widget/snack_bar.dart';
import '../../utils/constants.dart';

class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailScreen({required this.model, required this.isComeFromMoreSection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(model.name, style: AppThemes.detailsAppBar),
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
        body: DetailsBody(
          model: model,
          isComeFromMoreSection: isComeFromMoreSection,
          updateCart: addToCart,
        ));
  }

  void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedAddToCartSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successAddToCartSnackBar());
    }
  }
}
