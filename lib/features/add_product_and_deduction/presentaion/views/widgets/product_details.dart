


import 'package:flutter/material.dart';

import 'add_product_button.dart';
import 'add_product_text_form_field.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController name =TextEditingController();
    TextEditingController price =TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15.0,bottom: 25,right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buildShapeDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddProductTextFormField(
              formKey:formKey ,
              priceController: price,
              nameController: name,
            ),
            const SizedBox(
              width: 70,
            ),
            const AddProductButtons(),
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
