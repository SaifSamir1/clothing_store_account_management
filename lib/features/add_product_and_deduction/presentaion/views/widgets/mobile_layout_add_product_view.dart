import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'mobile_layout_product_details.dart';

class MobileLayoutAddProductView extends StatelessWidget {
  const MobileLayoutAddProductView(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                backButtonOnPressed: () {
                  GoRouter.of(context).pop();
                },
                title: 'Add Product',
                icon: Icons.production_quantity_limits,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '- Product Details',
                  style: AppStyles.styleSemiBold24WithoutFontFamily(context),
                ),
              ),
              FittedBox(
                  child: MobileLayoutProductDetails(
                allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
