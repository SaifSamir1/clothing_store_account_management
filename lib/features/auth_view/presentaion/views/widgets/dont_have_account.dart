









import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';

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
              'Don’t have an account? ',
              style: AppStyles.styleSemiBold14(context),
            ),
            TextButton(
              onPressed: ()
              {
                GoRouter.of(context).push(AppRouter.kSignIn);
              },
              child: Text(
                'Sign Up',
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
