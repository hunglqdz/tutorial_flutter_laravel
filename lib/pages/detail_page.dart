import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

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
  void addToCart(Item item, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.item.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(item, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.item.imagePath,
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.item.price.toString()} VND',
                    style: const TextStyle(fontSize: 30, color: Colors.orange),
                  ),
                  const Divider(),
                  Text(
                    LocaleData.addon.getString(context),
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
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
              onPressed: () => addToCart(widget.item, widget.selectedAddons),
              label: Text(LocaleData.addtocart.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
