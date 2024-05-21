import 'package:flutter/material.dart';

import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/widget/snack_bar.dart';
import 'package:sole_quest/widget/widget.dart';

import '../models/models.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
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

  static double sumOfItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel bagModel in itemsOnBag) {
      sumPrice = sumPrice + bagModel.price;
    }
    return sumPrice;
  }

  // add to favourites
  // static void handleToggleFavourites(ShoeModel data, BuildContext context) {
  //   bool contains = favItems.contains(data);

  //   if (contains == true) {
  //     favItems.remove(data);
  //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(successRemoveFromFavSnackBar());
  //   } else {
  //     favItems.add(data);
  //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //     ScaffoldMessenger.of(context).showSnackBar(successAddToFavSnackBar());
  //   }
  // }
}
