import 'package:account_mangment_responsive/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class TheListIsEmpty extends StatelessWidget {
  const TheListIsEmpty({super.key, required this.textMessage});

  final String textMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: Text(
          textMessage,
          style: AppStyles.styleSemiBold20(context),
        ),
      ),
    );
  }
}
