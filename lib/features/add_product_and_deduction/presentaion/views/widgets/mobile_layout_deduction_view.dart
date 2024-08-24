import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../generated/l10n.dart';
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
                backButtonOnPressed: () {
                  GoRouter.of(context).pop();
                },
                title: S.of(context).Deduction,
                icon: Icons.production_quantity_limits,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text(
                  '- ${S.of(context).DeductionDetails}',
                  style: AppStyles.styleSemiBold24WithoutFontFamily(context),
                ),
              ),
              FittedBox(
                  child: DeductionDetails(
                allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
