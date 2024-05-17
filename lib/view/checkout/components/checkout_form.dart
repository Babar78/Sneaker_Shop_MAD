import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cardNumberController;
  late TextEditingController _cardNameController;
  late DateTime _expiryDate;
  late TextEditingController _securityCodeController;

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _cardNameController = TextEditingController();
    _expiryDate = DateTime.now();
    _securityCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _securityCodeController.dispose();
    super.dispose();
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (picked != null && picked != _expiryDate) {
      setState(() {
        _expiryDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                suffixIcon: Icon(Icons.paypal, color: Colors.blue[900]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your card number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _cardNameController,
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the cardholder name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Expiry Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _selectExpiryDate(context);
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
              controller: TextEditingController(
                text: DateFormat('MM/yyyy').format(_expiryDate),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select the expiry date';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _securityCodeController,
              decoration: InputDecoration(
                labelText: 'Security Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the security code';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
