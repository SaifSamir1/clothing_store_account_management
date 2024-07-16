import 'package:flutter/material.dart';
import 'add_customer_buttons.dart';
import 'add_customer_text_form_filed.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController theBeginMoneyController =
        TextEditingController();
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, top: 15.0, bottom: 25, right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buildShapeDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddCustomerTextFormField(
              phoneNumberController: phoneNumberController,
              nameController: nameController,
              theBeginMoneyController: theBeginMoneyController,
            ),
            const SizedBox(
              width: 70,
            ),
            const AddCustomerButtons(),
          ],
        ),
      ),
    );
  }

  ShapeDecoration buildShapeDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
