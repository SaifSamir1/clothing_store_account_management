




import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import 'custom_app_bar.dart';
import 'customer_details.dart';

class DesktopLayoutAddCustomerView extends StatelessWidget {
  const DesktopLayoutAddCustomerView({super.key});

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
                title: 'Add Customer',
                icon: Icons.person,
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('- Customer Details',style: AppStyles.styleSemiBold24WithoutFontFamily(context),),
              ),
              const FittedBox(child: CustomerDetails()),
            ],
          ),
        ),
      ],
    );
  }
}


