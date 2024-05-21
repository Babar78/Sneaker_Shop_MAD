import 'package:flutter/material.dart';

SnackBar successAddToCartSnackBar() => SnackBar(
      backgroundColor: Colors.green[400],
      content: const Text('Successfully Added to your bag!'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );

SnackBar failedAddToCartSnackBar() => SnackBar(
      backgroundColor: Colors.red[400],
      content: const Text('You have added this item before!'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );
SnackBar successAddToFavSnackBar() => SnackBar(
      backgroundColor: Colors.green[400],
      content: const Text('Successfully Added to Favourites'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );

SnackBar successRemoveFromFavSnackBar() => SnackBar(
      backgroundColor: Colors.red[400],
      content: const Text('Item Removed from Favourites'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );
