


import 'package:flutter/material.dart';

import '../utils/constant.dart';

class RefreshIcon extends StatelessWidget {
  const RefreshIcon({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed:onPressed,
        icon: Icon(Icons.refresh,color: defaultColor,));
  }
}