import 'package:flutter/material.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'mobile_layout_customer_details.dart';

class CustomerDetailsViewBody extends StatelessWidget {
  const CustomerDetailsViewBody(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return MobileLayoutCustomerDetails(
      allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
    );
  }
}
