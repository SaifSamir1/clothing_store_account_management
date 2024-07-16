







import 'package:flutter/material.dart';

import 'dedction_text_form_fileds.dart';
import 'deduction_buttons.dart';

class DeductionDetails extends StatelessWidget {
  const DeductionDetails({
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
            DeductionTextFormField(
              byWhoController: name,
              deductionController: price,
              formKey: formKey,
            ),
            const SizedBox(
              width: 70,
            ),
            const DeductionButtons(),
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
