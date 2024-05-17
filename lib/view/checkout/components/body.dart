import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneakers_app/animation/fadeanimation.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/checkout/components/checkout_form.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  List itemsOnBag = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the arguments
    final args = ModalRoute.of(context)?.settings.arguments as List?;
    if (args != null) {
      itemsOnBag = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const CheckoutForm(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                'Summary',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ...itemsOnBag.map((item) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${item.model}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    Text(
                                      '\$${item.price}',
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${calculateTotal(itemsOnBag)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                materialButton(width, height),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotal(List items) {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

materialButton(width, height) {
  return FadeAnimation(
    delay: 0,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: width / 1.2,
      height: height / 15,
      color: AppConstantsColor.materialButtonColor,
      onPressed: () {
        // pass the itemsOnBag to the checkout screen
      },
      child: const Text(
        "Pay",
        style: TextStyle(color: AppConstantsColor.lightTextColor),
      ),
    ),
  );
}
