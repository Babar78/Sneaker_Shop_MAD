import 'package:flutter/material.dart';
import 'package:sole_quest/view/favourites/widget/app_bar.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarFav(context),
      body: Center(
        child: Text('Favourites Screen'),
      ),
    );
  }
}
