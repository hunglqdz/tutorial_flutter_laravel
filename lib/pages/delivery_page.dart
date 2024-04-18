import 'package:appdemo/widgets/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress...'),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [MyReceipt()],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('hunglqdz'), Text('Driver')],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.message)),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
