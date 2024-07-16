import 'package:account_mangment_responsive/features/add_and_edit_customer/data/repositry/add_edit_customer_repo_impl.dart';
import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/manger/edit_customer_cubit/edit_customer_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'custom_app_bar.dart';
import 'new_information_mobile_layout.dart';

class MobileLayoutEditCustomer extends StatelessWidget {
  const MobileLayoutEditCustomer(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

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
                title: S.of(context).EditCustomer,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '- ${S.of(context).CustomerDetails}',
                  style: AppStyles.styleSemiBold24WithoutFontFamily(context),
                ),
              ),
              FittedBox(
                  child: BlocProvider(
                create: (context) =>
                    EditCustomerCubit(AddEditCustomerRepoImpl()),
                child: NewInformationMobilLayout(
                  allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
