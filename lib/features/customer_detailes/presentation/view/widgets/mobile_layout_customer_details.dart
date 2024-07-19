import 'package:account_mangment_responsive/core/routing/app_router.dart';
import 'package:account_mangment_responsive/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'mobile_layout_account_details.dart';

class MobileLayoutCustomerDetails extends StatelessWidget {
  const MobileLayoutCustomerDetails(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          backButtonOnPressed: () {
            GoRouter.of(context).pop();
          },
          title: allDetailsForTheCustomerModel.customerDetails.customerName!,
          icon: Icons.person,
          actionIcon: Icons.edit,
          actionButtonOnPressed: () {
            GoRouter.of(context).push(Routes.editCustomer,
                extra: allDetailsForTheCustomerModel);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: MobilLayoutAccountDetails(
              allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
            ),
          ),
      ],
    );
  }
}
