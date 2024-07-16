


import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class SignHeader extends StatelessWidget {
  const SignHeader({
    super.key, required this.header,
  });

  final String header;
  @override
  Widget build(BuildContext context) {
    return Text(header,style: AppStyles.styleSemiBold24WithoutFontFamily(context).copyWith(
    ),
      textAlign: TextAlign.start,
    );
  }
}


