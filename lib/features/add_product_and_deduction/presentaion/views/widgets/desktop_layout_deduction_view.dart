



import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import 'deduction_details.dart';

class DesktopLayoutDeductionView extends StatelessWidget {
  const DesktopLayoutDeductionView({super.key});

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
                title: 'Deduction Form The Account',
                icon: Icons.monetization_on_outlined,
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('- Deduction Details',style: AppStyles.styleSemiBold24WithoutFontFamily(context),),
              ),
              const FittedBox(child: DeductionDetails()),
            ],
          ),
        ),
      ],
    );
  }
}
