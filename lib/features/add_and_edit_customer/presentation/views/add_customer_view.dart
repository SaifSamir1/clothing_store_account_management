import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/views/widgets/add_customer_view_body.dart';
import 'package:flutter/material.dart';


class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffFFFFFF),
        body: const AddCustomerViewBody(),
      ),
    );
  }
}



