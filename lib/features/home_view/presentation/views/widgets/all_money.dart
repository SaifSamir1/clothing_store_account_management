import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';

class AllMoney extends StatelessWidget {
  const AllMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).totalAccount),
      leading: const Icon(Icons.money),
      onTap: () {
        GoRouter.of(context).pop();
        GoRouter.of(context).push(Routes.totalAmount);
      },
    );
  }
}
