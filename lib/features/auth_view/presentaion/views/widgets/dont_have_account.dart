

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../generated/l10n.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: FittedBox(
        child: Row(
          children: [
            Text(
              S.of(context).donthaveAccount,
              style: AppStyles.styleSemiBold14(context),
            ),
            TextButton(
              onPressed: ()
              {
                GoRouter.of(context).pushReplacement(Routes.signUp);
              },
              child: Text(
                S.of(context).signup,
                style: AppStyles.styleSemiBold14(context).copyWith(
                  color: defaultColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
