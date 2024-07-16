import 'package:flutter/cupertino.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'mobile_layout_deduction_view.dart';

class DeductionProductViewBody extends StatelessWidget {
  const DeductionProductViewBody(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return MobileLayoutDeductionView(
      allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
    );
  }
}
