









import 'package:flutter/material.dart';

import 'edit_customer_buttons.dart';
import 'edit_customer_text_form_filed.dart';

class NewInformation extends StatelessWidget {
  const NewInformation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController moneyController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15.0,bottom: 25,right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15 ),
        decoration: buildShapeDecoration(),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            EditCustomerTextFormField(
              phoneNumberController: phoneNumberController,
              priceController:moneyController,
              nameController: nameController,
            ),
            const SizedBox(
              width: 70,
            ),
            const EditCustomerButtons(),
          ],
        ),
      ),
    );
  }

  ShapeDecoration buildShapeDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: OutlineInputBorder(
        borderSide:const BorderSide(width: 2,color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

