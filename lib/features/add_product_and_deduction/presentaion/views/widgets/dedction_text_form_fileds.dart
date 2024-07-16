


import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class DeductionTextFormField extends StatelessWidget {
  const DeductionTextFormField({
    super.key, required this.byWhoController, required this.deductionController, required this.formKey,
  });
  final TextEditingController byWhoController;
  final TextEditingController deductionController;

  final GlobalKey<FormState> formKey ;
  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width< 1114 ? 400: 600,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'by Who',
              controller: byWhoController,
              keyBoardType: TextInputType.name,
              valedate: (value){
                return null;
              },
            ),
            const SizedBox(height: 15,),
            CustomTextFormField(
              hintText: 'The amount of the deduction',
              controller: deductionController,
              keyBoardType: TextInputType.number,
              valedate: (value){
                return 'the amount of the deduction must not be empty';
              },
            ),
          ],
        ),
      ),
    );
  }
}
