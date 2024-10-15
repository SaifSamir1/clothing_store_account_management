import 'package:account_mangment_responsive/core/routing/app_router.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/the_list_is_empty_widget.dart';
import 'list_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<HomeCubit>(context).allCustomersDetails.docs.isEmpty
        ? SliverToBoxAdapter(
            child: TheListIsEmpty(
            textMessage: '${S.of(context).noCustomersYet} ....',
          ))
        : SliverList.builder(
            itemCount: BlocProvider.of<HomeCubit>(context)
                .allCustomersDetails
                .docs
                .length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  navigateToCustomerDetailsScreen(index, context);
                },
                child: CustomerItem(
                  index: index,
                ),
              );
            },
          );
  }

  void navigateToCustomerDetailsScreen(int index, BuildContext context) {
    AllDetailsForTheCustomerModel allDetailsForTheCustomerModel =
        AllDetailsForTheCustomerModel(
            customerDetails: BlocProvider.of<HomeCubit>(context)
                .allCustomersDetails
                .allCustomer[index],
            customerId: BlocProvider.of<HomeCubit>(context)
                .allCustomersDetails
                .docs[index]
                .id);
    GoRouter.of(context)
        .push(Routes.customerDetailsView, extra: allDetailsForTheCustomerModel);
  }
}
