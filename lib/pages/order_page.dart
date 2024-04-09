import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.order.getString(context)),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
      ),
    );
  }
}
