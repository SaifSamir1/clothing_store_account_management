import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class AddCustomerTextFormField extends StatelessWidget {
  const AddCustomerTextFormField({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.theBeginMoneyController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController theBeginMoneyController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width > 1124 ? 600 : 400,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: S.of(context).customersNames,
            controller: nameController,
            keyBoardType: TextInputType.name,
            valedate: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: S.of(context).CustomersPhoneNumber,
            controller: phoneNumberController,
            keyBoardType: TextInputType.number,
            valedate: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: S.of(context).Thebeginmoney,
            controller: theBeginMoneyController,
            keyBoardType: TextInputType.number,
            valedate: (value) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}
