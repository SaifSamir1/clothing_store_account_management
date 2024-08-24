

import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/views/widgets/edit_customer_view_body.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/models/all_details_for_the_customer_model.dart';
import 'package:flutter/material.dart';


class EditCustomerView extends StatelessWidget {
  const EditCustomerView({super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffFFFFFF),
        body: EditCustomerViewBody(
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
        ),
      ),
    );
  }
}


