import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolder = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Confirm payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('Card Number: $cardNumber'),
                      Text('Expiry Date: $expiryDate'),
                      Text('Card Holder: $cardHolder'),
                      Text('CVV: $cvvCode'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.red))),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DeliveryPage()),
                      );
                    },
                    child: const Text('Yes',
                        style: TextStyle(color: Colors.green)),
                  )
                ],
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolder,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolder,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolder = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: userTappedPay, child: const Text('Pay'))
          ],
        ),
      ),
    );
  }
}
