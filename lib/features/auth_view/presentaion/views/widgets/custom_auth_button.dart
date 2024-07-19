import 'package:account_mangment_responsive/core/theme/app_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.minWidth,
    this.icon,
    this.color,
    this.isLoading = false,
    this.iconColor,
    this.buttonHeight,
    this.textStyle,
  });

  final String text;
  final VoidCallback onPressed;
  final double minWidth;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final bool? isLoading;
  final TextStyle? textStyle;
  final double? buttonHeight;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(left: 15, right:15),
      onPressed: onPressed,
      color: color ?? Colors.transparent,
      elevation: 0,
      minWidth: minWidth,
      height: buttonHeight ?? 48,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white)),
      child: isLoading!
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: iconColor ?? Colors.white,
                    size: 20,
                  ),
                const SizedBox(
                  width: 5,
                ),
                Text(text,
                    textAlign: TextAlign.center,
                    style:textStyle ?? AppStyles.styleSemiBold14(context).copyWith(
                      color: iconColor ?? Colors.white,
                    )),
              ],
            ),
    );
  }
}
