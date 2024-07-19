import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_alert_dialoge.dart';

class ChangeTheDay extends StatelessWidget {
  const ChangeTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.change_circle_outlined),
      title: Text(S.of(context).changeTheDay),
      onTap: () {
        _showCustomDialog(context);
      },
    );
  }
}

void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Use a custom AlertDialog widget
      return CustomAlertDialog(
        title: '',
        content: S.of(context).sureness,
        nameOfPositiveButton: S.of(context).yes,
        nameOfNegativeButton: S.of(context).cansle,
        onPositiveButtonPressed: () {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(Routes.selectTheDay);
        },
        onNegativeButtonPressed: () {
          Navigator.of(context).pop(); // Close the dialog
          // Add custom logic for negative button
        },
      );
    },
  );
}
