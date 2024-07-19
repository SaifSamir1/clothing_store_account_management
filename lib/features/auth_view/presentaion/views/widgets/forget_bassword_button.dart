import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          overlayColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {},
        child: Text(
          S.of(context).loginForgetPass,
          style: AppStyles.styleRegular14(context).copyWith(
            color: defaultColor,
          ),
        ));
  }
}
