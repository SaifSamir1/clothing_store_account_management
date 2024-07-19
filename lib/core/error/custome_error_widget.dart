

import 'package:account_mangment_responsive/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      textAlign: TextAlign.center,
      style: AppStyles.styleSemiBold20(context),
    );
  }
}
