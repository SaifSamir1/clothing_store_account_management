import 'package:flutter/material.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'mobile_layout_add_product_view.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({
    super.key,
    required this.allDetailsForTheCustomerModel,
  });
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return MobileLayoutAddProductView(
      allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
    );
  }
}
