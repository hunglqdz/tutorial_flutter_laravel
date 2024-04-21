import 'package:flutter/material.dart';

import '../models/order.dart';

class CreateOrderWidget extends StatefulWidget {
  final Order? order;
  final ValueChanged<int> onSubmit;
  const CreateOrderWidget({super.key, this.order, required this.onSubmit});

  @override
  State<CreateOrderWidget> createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.order?.tableId.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.order != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Order' : 'Add Order'),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          decoration: const InputDecoration(hintText: 'TableId'),
          validator: (value) => value != null && value.isEmpty
              ? 'TableId is required'
              : 'Good job',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              widget.onSubmit(controller.text as int);
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
