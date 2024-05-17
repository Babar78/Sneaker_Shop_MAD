import 'package:flutter/material.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/checkout/components/app_bar.dart';
import 'package:sneakers_app/view/checkout/components/body.dart';

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
