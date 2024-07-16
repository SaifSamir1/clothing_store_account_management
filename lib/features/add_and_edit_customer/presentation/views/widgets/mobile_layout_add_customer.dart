import 'package:account_mangment_responsive/core/utils/app_router.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_style.dart';
import 'custom_app_bar.dart';
import 'customer_details_mobile_layout.dart';

class MobileLayoutAddCustomer extends StatelessWidget {
  const MobileLayoutAddCustomer({super.key});

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
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                },
                title: S.of(context).addCustomer,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '- ${S.of(context).CustomerDetails}',
                  style: AppStyles.styleSemiBold24WithoutFontFamily(context),
                ),
              ),
              const FittedBox(child: CustomerDetailsMobilLayout()),
            ],
          ),
        ),
      ],
    );
  }
}
