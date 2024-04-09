import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.stats.getString(context)),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
      ),
    );
  }
}
