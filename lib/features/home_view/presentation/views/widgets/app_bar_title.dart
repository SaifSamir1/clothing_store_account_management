import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold24WithoutFontFamily(context)
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
