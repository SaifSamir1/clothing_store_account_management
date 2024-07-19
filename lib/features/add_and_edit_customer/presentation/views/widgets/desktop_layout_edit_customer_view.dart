





import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import 'custom_app_bar.dart';
import 'new_information.dart';

class DesktopLayoutEditCustomerView extends StatelessWidget {
  const DesktopLayoutEditCustomerView({super.key});

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
                title: 'Edit Customer Details',
                icon: Icons.person,
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('- New Information',style: AppStyles.styleSemiBold24WithoutFontFamily(context),),
              ),
              const FittedBox(child: NewInformation()),
            ],
          ),
        ),
      ],
    );
  }
}

