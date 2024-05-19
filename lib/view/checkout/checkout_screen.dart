import 'package:flutter/material.dart';
import 'package:sole_quest/utils/constants.dart';
import 'package:sole_quest/view/checkout/components/app_bar.dart';
import 'package:sole_quest/view/checkout/components/body.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarCheckout(context),
        body: const CheckoutBody(),
      ),
    );
  }
}
