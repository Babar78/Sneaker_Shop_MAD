import 'package:flutter/material.dart';
import 'package:sneakers_app/utils/constants.dart';

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
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              // Add a ListView of Items
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const Text('Items on Bag',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  // Add a ListView of Items
                  ListView(
                    shrinkWrap: true,
                    children: itemsOnBag.map((item) {
                      return ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${item.model}',
                                  style: const TextStyle(color: Colors.black)),
                              Text(
                                '\$${item.price}',
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ]),
                      );
                    }).toList(),
                  )
                ]),
              ),

              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Summary',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Total: \$${itemsOnBag.length * 100}',
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
