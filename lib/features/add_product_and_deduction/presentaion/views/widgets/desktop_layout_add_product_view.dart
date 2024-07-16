


import 'package:account_mangment_responsive/features/add_product_and_deduction/presentaion/views/widgets/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';

class DesktopLayoutAddProductView extends StatelessWidget {
  const DesktopLayoutAddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                backButtonOnPressed: (){},
                title: 'Add Product',
                icon: Icons.production_quantity_limits,
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('- Product Details',style: AppStyles.styleSemiBold24WithoutFontFamily(context),),
              ),
              const FittedBox(child: ProductDetails()),
            ],
          ),
        ),
      ],
    );
  }
}
