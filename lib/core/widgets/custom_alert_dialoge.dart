import 'package:flutter/material.dart';

import '../utils/app_style.dart';
import '../utils/constant.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String nameOfPositiveButton;
  final String nameOfNegativeButton;
  final VoidCallback? onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;
  final bool? isLoading ;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
    required this.nameOfPositiveButton,
    required this.nameOfNegativeButton, this.isLoading= false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppStyles.styleRegular16(context).copyWith(color: defaultColor),
      ),
      content: Text(
        content,
        style: AppStyles.styleSemiBold20(context).copyWith(color:  Colors.black),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: onNegativeButtonPressed,
          child: Text(
            nameOfNegativeButton,
            style: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onPositiveButtonPressed,
          child: isLoading! ? const Center(child: CircularProgressIndicator(color: Colors.white,),) : Text(
            nameOfPositiveButton,
            style: AppStyles.styleSemiBold20(context)
                .copyWith(color: defaultColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
