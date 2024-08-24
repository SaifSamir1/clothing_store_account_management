


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../generated/l10n.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings),
      title: Text(S.of(context).setting),
      onTap: () {
        GoRouter.of(context).push(Routes.settingScreen,);
      },
    );
  }
}