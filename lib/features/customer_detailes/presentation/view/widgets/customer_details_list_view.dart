import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/the_list_is_empty_widget.dart';
import '../../../../add_product_and_deduction/data/models/product_model.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'details_grid_item.dart';

class CustomerDetailsListView extends StatelessWidget {
  const CustomerDetailsListView({
    super.key,
    required this.allDetailsForTheCustomerModel,
    required this.productsAndDeductionDetails,
    required this.allProducts,
  });

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final List<AddProductAndDeductionModel> productsAndDeductionDetails;
  final List<QueryDocumentSnapshot> allProducts;

  @override
  Widget build(BuildContext context) {
    return allProducts.isEmpty
        ? TheListIsEmpty(
            textMessage: '${S.of(context).NoDetailsYet}....',
          )
        : ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: allProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                  aspectRatio: 4.5,
                  child: DetailsItem(
                    allProducts: allProducts,
                    productsAndDeductionDetails: productsAndDeductionDetails,
                    index: index,
                    allDetailsForTheCustomerModel:
                        allDetailsForTheCustomerModel,
                  ));
            },
          );
  }
}
