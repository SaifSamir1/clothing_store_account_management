







import 'package:flutter/material.dart';

import '../../../../home_view/data/models/customer_model.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'details_grid_item.dart';

class AccountDetailsBody extends StatelessWidget {
  const AccountDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 10 ),
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 10
      ), itemBuilder: (BuildContext context, int index) {
      return  GestureDetector(
          onTap: (){},
          child: DetailsItem(
            allProducts: const [],
            productsAndDeductionDetails: const [],
            index: index,
            allDetailsForTheCustomerModel: AllDetailsForTheCustomerModel(customerDetails: CustomerModel(), customerId: ''),
          ));
    },);
  }
}


