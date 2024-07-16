import 'package:account_mangment_responsive/core/utils/app_router.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/repositry/customer_details_repo_impl.dart';
import 'package:account_mangment_responsive/features/customer_detailes/presentation/manger/customer_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            GoRouter.of(context).push(AppRouter.kEditCustomer,
                extra: allDetailsForTheCustomerModel);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: BlocProvider(
          create: (context) => CustomerDetailsCubit(CustomerDetailsRepoImpl()),
          child: MobilLayoutAccountDetails(
            allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
          ),
        )),
      ],
    );
  }
}
