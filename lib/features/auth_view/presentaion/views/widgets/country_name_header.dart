import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class SelectTheDayHeader extends StatelessWidget {
  const SelectTheDayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).selTheday,
      style: AppStyles.styleSemiBold24WithoutFontFamily(context).copyWith(),
      textAlign: TextAlign.start,
    );
  }
}
