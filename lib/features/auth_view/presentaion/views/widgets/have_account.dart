import 'package:account_mangment_responsive/core/utils/app_router.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(top: 20),
      child: FittedBox(
        child: Row(
          children: [
            Text(
              S.of(context).haveAccount,
              style: AppStyles.styleSemiBold14(context),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignIn);
              },
              child: Text(
                S.of(context).login,
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
