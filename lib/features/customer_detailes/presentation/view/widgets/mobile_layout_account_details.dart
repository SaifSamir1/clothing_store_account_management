import 'package:flutter/material.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'account_details_header.dart';
import 'mobile_layout_account_details_body.dart';

class MobilLayoutAccountDetails extends StatelessWidget {
  const MobilLayoutAccountDetails(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        AccountDetailsHeader(
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
        ),
        const Divider(endIndent: 20, indent: 20),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: MobilLayoutAccountDetailsBody(
            allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
          ),
        )),
      ],
    );
  }
}
