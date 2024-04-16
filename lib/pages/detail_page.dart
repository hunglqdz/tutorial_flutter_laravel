import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  final Map<Addon, bool> selectedAddons = {};
  DetailPage({super.key, required this.item}) {
    for (Addon addon in item.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(widget.item.imagePath),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${widget.item.price.toString()}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 15),
                Divider(color: Theme.of(context).colorScheme.tertiary),
                const SizedBox(height: 15),
                Text(
                  'Add-ons',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.item.availableAddons.length,
                    itemBuilder: (context, index) {
                      Addon addon = widget.item.availableAddons[index];
                      return CheckboxListTile(
                        value: widget.selectedAddons[addon],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.selectedAddons[addon] = value!;
                          });
                        },
                        title: Text(addon.name,
                            style: const TextStyle(color: Colors.grey)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {},
            label: Text(LocaleData.addtocart.getString(context)),
          ),
        ],
      ),
    );
  }
}
