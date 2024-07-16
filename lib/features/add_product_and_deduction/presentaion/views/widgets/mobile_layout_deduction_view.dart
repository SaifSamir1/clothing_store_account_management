import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'mobile_layout_deduction_details.dart';

class MobileLayoutDeductionView extends StatelessWidget {
  const MobileLayoutDeductionView(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                backButtonOnPressed: () {},
                title: 'Deduction',
                icon: Icons.production_quantity_limits,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '- Deduction Details',
                  style: AppStyles.styleSemiBold24WithoutFontFamily(context),
                ),
              ),
              FittedBox(
                  child: MobileLayoutDeductionDetails(
                allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
