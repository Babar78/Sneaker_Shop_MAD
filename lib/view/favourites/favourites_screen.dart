import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sole_quest/animation/fadeanimation.dart';
import 'package:sole_quest/data/dummy_data.dart';
import 'package:sole_quest/models/models.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';
import 'package:sole_quest/utils/app_methods.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:sole_quest/view/favourites/widget/app_bar.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: customAppBarFav(context),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              itemCount: favItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                    width / (height / 1.5), // Adjust the height ratio
              ),
              itemBuilder: (ctx, index) {
                ShoeModel model = favItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          model: model,
                          isComeFromMoreSection: true,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: width / 13,
                            height: height / 10,
                            color: Colors.red,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: FadeAnimation(
                                  delay: 1.5,
                                  child: const Text("Favorite",
                                      style: AppThemes.homeGridNewText),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              handleToggleFavourites(model, context);
                            },
                            icon: Icon(
                              favItems.contains(model)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: favItems.contains(model)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 26,
                          left: 25,
                          child: FadeAnimation(
                            delay: 1.5,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-15 / 360),
                              child: Container(
                                width: width / 3,
                                height: height / 6,
                                child: Hero(
                                  tag: model.model,
                                  child: Image(
                                    image: AssetImage(model.imgAddress),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 165,
                          left: 45,
                          child: FadeAnimation(
                            delay: 2,
                            child: Container(
                              width: width / 4,
                              height: height / 42,
                              child: FittedBox(
                                child: Text("${model.name}",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 185,
                          left: 45,
                          child: FadeAnimation(
                            delay: 2,
                            child: Container(
                              width: width / 4,
                              height: height / 42,
                              child: FittedBox(
                                child: Text("${model.model}",
                                    style: AppThemes.homeGridNameAndModel),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 205,
                          left: 45,
                          child: FadeAnimation(
                            delay: 2.2,
                            child: Container(
                              width: width / 4,
                              height: height / 42,
                              child: FittedBox(
                                child: Text(
                                    "\$${model.price.toStringAsFixed(2)}",
                                    style: AppThemes.homeGridPrice),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            left: 25,
                            child: FadeAnimation(
                                delay: 2.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        AppMethods.addToCart(model, context);
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets
                                            .zero, // Remove default padding
                                      ),
                                      child: Container(
                                        width: width / 3,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.5),
                                          color: Colors.black87,
                                        ),
                                        alignment: Alignment
                                            .center, // Center the child within the container
                                        child: const Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w100,
                                            decoration: TextDecoration.none,
                                          ),
                                          textAlign: TextAlign
                                              .center, // Center the text within the Text widget
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void handleToggleFavourites(ShoeModel data, BuildContext context) {
    bool contains = favItems.contains(data);

    if (contains == true) {
      setState(() {
        favItems.remove(data);
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(successRemoveFromFavSnackBar());
    } else {
      setState(() {
        favItems.add(data);
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successAddToFavSnackBar());
    }
  }
}
