// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sole_quest/models/shoe_model.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/view/detail/components/app_bar.dart';
import 'package:sole_quest/view/detail/components/body.dart';
import '../../utils/constants.dart';

class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailScreen({required this.model, required this.isComeFromMoreSection});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              icon: Icon(
                Icons.arrow_back,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
          body: DetailsBody(
            model: model,
            isComeFromMoreSection: isComeFromMoreSection,
          )),
    );
  }
}
