import 'package:account_mangment_responsive/features/add_product_and_deduction/presentaion/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';

import '../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffFFFFFF),
        body: AddProductViewBody(
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
        ),
      ),
    );
  }
}
