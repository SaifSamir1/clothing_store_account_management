import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'edit_button_bloc_consumer.dart';

class EditCustomerButtonsMobilLayout extends StatelessWidget {
  const EditCustomerButtonsMobilLayout({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.moneyController,
    required this.allDetailsForTheCustomerModel,
  });
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  final TextEditingController nameController;

  final TextEditingController phoneNumberController;
  final TextEditingController moneyController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomButton(
          text: S.of(context).cansle,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          minWidth: 80,
          color: Colors.blueGrey,
        ),
        const SizedBox(
          width: 20,
        ),
        EditButtonBlocConsumer(
          nameController: nameController,
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
          moneyController: moneyController,
          phoneNumberController: phoneNumberController,
        ),
      ],
    );
  }
}
