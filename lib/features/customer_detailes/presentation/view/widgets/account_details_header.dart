import 'package:account_mangment_responsive/features/customer_detailes/presentation/view/widgets/the_final_amount.dart';
import 'package:flutter/material.dart';

import '../../../data/models/all_details_for_the_customer_model.dart';
import 'add_and_deduction_buttons.dart';

class AccountDetailsHeader extends StatelessWidget {
  const AccountDetailsHeader(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TheFinalAmount(allDetailsForTheCustomerModel: allDetailsForTheCustomerModel),
        const SizedBox(
          height: 8,
        ),
        AddAndDeductionButtons(allDetailsForTheCustomerModel: allDetailsForTheCustomerModel),
      ],
    );
  }
}
