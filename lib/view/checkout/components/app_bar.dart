import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/custom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';

PreferredSize? customAppBarCheckout(BuildContext ctx) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text("Checkout", style: AppThemes.checkoutAppBar),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(ctx);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.darkTextColor,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          color: Colors.grey[350], // Set your desired border color here
          height: 1,
        ),
      ),
    ),
  );
}
