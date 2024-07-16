


import 'package:flutter/material.dart';

import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'edit_customer_buttons_mobile_layout.dart';
import 'edit_customer_text_form_filed.dart';

class NewInformationMobilLayout extends StatefulWidget {
  const NewInformationMobilLayout({
    super.key, required this.allDetailsForTheCustomerModel,
  });
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<NewInformationMobilLayout> createState() => _NewInformationMobilLayoutState();
}

class _NewInformationMobilLayoutState extends State<NewInformationMobilLayout> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController moneyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    moneyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15.0,bottom: 25,right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buildShapeDecoration(),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EditCustomerTextFormField(
              nameController: nameController,
              priceController: moneyController,
              phoneNumberController: phoneNumberController,
            ),
            const SizedBox(
              height: 30,
            ),
            EditCustomerButtonsMobilLayout(
              nameController: nameController,
              moneyController: moneyController,
              phoneNumberController: phoneNumberController,
              allDetailsForTheCustomerModel: widget.allDetailsForTheCustomerModel,
            ),
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
