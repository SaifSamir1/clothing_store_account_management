import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:account_mangment_responsive/features/customer_detailes/presentation/manger/customer_details_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/custome_error_widget.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'customer_details_list_view.dart';

class MobilLayoutAccountDetailsBody extends StatefulWidget {
  const MobilLayoutAccountDetailsBody(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<MobilLayoutAccountDetailsBody> createState() =>
      _MobilLayoutAccountDetailsBodyState();
}

class _MobilLayoutAccountDetailsBodyState
    extends State<MobilLayoutAccountDetailsBody> {
  List<AddProductAndDeductionModel> productsAndDeductionDetails = [];
  List<QueryDocumentSnapshot> allProducts = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerDetailsCubit>(context).getCustomerDetailsBody(
        customerId: widget.allDetailsForTheCustomerModel.customerId,
        docs: allProducts,
        productsAndDeductionDetails: productsAndDeductionDetails);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerDetailsCubit, CustomerDetailsState>(
      builder: (context, state) {
        if (state is GetCustomerDetailsError) {
          return SizedBox(
            height: 500,
            child: Center(
              child: CustomErrorWidget(
                errorMessage: S.of(context).internetError,
              ),
            ),
          );
        }
        if (state is GetCustomerDetailsSuccess) {
          return CustomerDetailsListView(
              productsAndDeductionDetails: productsAndDeductionDetails,
              allProducts: allProducts,
              allDetailsForTheCustomerModel:
                  widget.allDetailsForTheCustomerModel);
        }
        return SizedBox(
            height: 500,
            child: Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            ));
      },
    );
  }
}
