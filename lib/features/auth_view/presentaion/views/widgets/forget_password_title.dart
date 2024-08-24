import 'package:account_mangment_responsive/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).resetPassword,
          style: AppStyles.styleBold32(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          S.of(context).passwordResetDetails,
          style: AppStyles.styleMedium16(context).copyWith(
             color:  Colors.grey[700]
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
