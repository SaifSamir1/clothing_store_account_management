










import 'package:flutter/material.dart';

import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import 'account_details.dart';

class DesktopLayoutCustomerDetailsView extends StatelessWidget {
  const DesktopLayoutCustomerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          backButtonOnPressed: (){},
          title: 'Saif Samir',
          icon: Icons.person,
          actionIcon: Icons.edit,
        ),
        const SizedBox(height: 15,),
        const Expanded(child: AccountDetails()),
      ],
    );
  }
}


