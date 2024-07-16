import 'package:flutter/material.dart';
import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'mobile_layout_edit_customer.dart';

class EditCustomerViewBody extends StatelessWidget {
  const EditCustomerViewBody(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return MobileLayoutEditCustomer(
      allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
    );
  }
}
