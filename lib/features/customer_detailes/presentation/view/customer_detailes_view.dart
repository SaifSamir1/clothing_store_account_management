
import 'package:account_mangment_responsive/features/customer_detailes/presentation/view/widgets/customer_details_view_body.dart';
import 'package:flutter/material.dart';
import '../../data/models/all_details_for_the_customer_model.dart';

class CustomerDetailsView extends StatelessWidget {
  const CustomerDetailsView({super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: CustomerDetailsViewBody(
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
        ),
      ),
    );
  }
}

