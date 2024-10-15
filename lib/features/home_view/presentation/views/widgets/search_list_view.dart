import 'dart:developer';

import 'package:account_mangment_responsive/core/routing/routes.dart';
import 'package:account_mangment_responsive/core/utils/global_variable.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/searched_list_view_customer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: searchedForCharacters.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            navigateToCustomerDetailsScreen(index, context);
          },
          child: SearchedListViewCustomerItem(
            index: index,
          ),
        );
      },
    );
  }

  void navigateToCustomerDetailsScreen(int index, BuildContext context) {
    AllDetailsForTheCustomerModel allDetailsForTheCustomerModel =
        AllDetailsForTheCustomerModel(
      customerDetails: searchedForCharacters[index],
      customerId: BlocProvider.of<HomeCubit>(context)
          .allCustomersDetails
          .docs[getCustomerIndex(
            context: context,
            customerName: searchedForCharacters[index].customerName!,
          )]
          .id,
    );
    GoRouter.of(context).push(
      Routes.customerDetailsView,
      extra: allDetailsForTheCustomerModel,
    );
  }
}
