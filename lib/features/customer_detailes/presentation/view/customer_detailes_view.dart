import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import 'package:account_mangment_responsive/features/customer_detailes/presentation/view/widgets/customer_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/all_details_for_the_customer_model.dart';

class CustomerDetailsView extends StatelessWidget {
  const CustomerDetailsView(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: allDetailsForTheCustomerModel.customerDetails
            .customerName!,
        context: context,
        action: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(Routes.editCustomer,
                      extra: allDetailsForTheCustomerModel);
                },
                child: Text(
                  S.of(context).edit,
                  style: AppStyles.styleMedium20White(context),
                )),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: CustomerDetailsViewBody(
        allDetailsForTheCustomerModel:
        allDetailsForTheCustomerModel,
      ),
    );
  }
}
