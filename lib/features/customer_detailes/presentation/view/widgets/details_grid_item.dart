import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../add_product_and_deduction/data/models/product_model.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem(
      {super.key,
      required this.index,
      required this.allDetailsForTheCustomerModel,
      required this.productsAndDeductionDetails,
      required this.allProducts});
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final int index;
  final List<AddProductAndDeductionModel> productsAndDeductionDetails;
  final List<QueryDocumentSnapshot> allProducts;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15,bottom: 15),
        child: Row(
          children: [
            Text(
              '${productsAndDeductionDetails[index].money}',
              style: AppStyles.styleMedium20(context)
                  .copyWith(color: defaultColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.black26,
              width: 1,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(productsAndDeductionDetails[index].dateTime!),
              style: AppStyles.styleRegular16(context),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.black26,
              width: 1,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${productsAndDeductionDetails[index].productNameOrByWho}',
              style: AppStyles.styleRegular16(context),
            ),
          ],
        ),
      ),
    );
  }
}
