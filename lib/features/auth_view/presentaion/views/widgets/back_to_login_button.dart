

import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/l10n.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        S.of(context).backToLogin,
        style: TextStyle(
          fontSize: 16.0,
          color: defaultColor,
        ),
      ),
    );
  }
}
