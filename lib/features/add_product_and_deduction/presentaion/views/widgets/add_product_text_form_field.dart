


import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class AddProductTextFormField extends StatelessWidget {
  const AddProductTextFormField({
    super.key, required this.nameController, required this.priceController, required this.formKey,
  });
  final TextEditingController nameController ;
  final TextEditingController priceController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width < 1114 ? 400 : 600,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Product\'s Name',
              controller: nameController,
              keyBoardType: TextInputType.name,
              valedate: (value){
                return '';
              },
            ),
            const SizedBox(height: 15,),
            CustomTextFormField(
              hintText: 'Product\'s price',
              controller: priceController,
              keyBoardType: TextInputType.number,
              valedate: (value){
                return 'Product price must not be empty';
              },
            ),
          ],
        ),
      ),
    );
  }
}
