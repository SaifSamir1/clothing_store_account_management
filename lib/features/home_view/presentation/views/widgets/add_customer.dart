import 'package:account_mangment_responsive/core/routing/app_router.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(
            text: S.of(context).addCustomer,
            onPressed: () {
              GoRouter.of(context).push(Routes.addCustomer);
            },
            minWidth: 130,
            icon: Icons.add,
            color: defaultColor,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
