import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/the_list_is_empty_widget.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import '../../manger/customer_details_cubit.dart';
import 'details_grid_item.dart';

class CustomerDetailsListView extends StatelessWidget {
  const CustomerDetailsListView({
    super.key,
    required this.allDetailsForTheCustomerModel,
  });

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<CustomerDetailsCubit>(context)
            .customerProductDetails!
            .docs
            .isEmpty
        ? TheListIsEmpty(
            textMessage: '${S.of(context).NoDetailsYet}....',
          )
        : ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: BlocProvider.of<CustomerDetailsCubit>(context)
                .customerProductDetails!
                .docs
                .length,
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 4.5,
                child: DetailsItem(
                  allProducts: BlocProvider.of<CustomerDetailsCubit>(context)
                      .customerProductDetails!
                      .docs,
                  productsAndDeductionDetails:
                      BlocProvider.of<CustomerDetailsCubit>(context)
                          .customerProductDetails!
                          .productsAndDeductionDetails,
                  index: index,
                  allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
                ),
              );
            },
          );
  }
}
