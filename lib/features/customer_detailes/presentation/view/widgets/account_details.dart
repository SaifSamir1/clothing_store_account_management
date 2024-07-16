







import 'package:account_mangment_responsive/features/customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:flutter/material.dart';

import 'account_details_body.dart';
import 'account_details_header.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AccountDetailsHeader(
          allDetailsForTheCustomerModel: AllDetailsForTheCustomerModel(customerDetails: CustomerModel(), customerId: ''),
        ),
        const Divider(endIndent: 20,indent: 20),
        const Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: AccountDetailsBody(),
        )),
      ],
    );
  }
}