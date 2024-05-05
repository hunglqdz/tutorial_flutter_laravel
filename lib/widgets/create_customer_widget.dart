import 'package:appdemo/models/customer.dart';
import 'package:flutter/material.dart';

class CreateCustomerWidget extends StatefulWidget {
  final Customer? customer;
  final Function onSubmit;

  const CreateCustomerWidget({
    super.key,
    this.customer,
    required this.onSubmit,
  });

  @override
  State<CreateCustomerWidget> createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.customer?.name ?? '';
    phoneController.text = widget.customer?.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.customer != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Customer' : 'Add Customer'),
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
              validator: (value) =>
                  value != null && value.isEmpty ? 'Name is required' : null,
            ),
            TextFormField(
              autofocus: true,
              controller: phoneController,
              decoration: const InputDecoration(hintText: 'Phone'),
              validator: (value) =>
                  value != null && value.isEmpty ? 'Phone is required' : null,
            ),
          ],
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
              widget.onSubmit(nameController.text, phoneController.text);
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
