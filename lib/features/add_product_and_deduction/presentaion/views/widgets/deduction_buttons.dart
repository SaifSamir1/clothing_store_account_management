







import 'package:flutter/material.dart';

import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';

class DeductionButtons extends StatelessWidget {
  const DeductionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Deduction',
          onPressed: () {},
          minWidth: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          text: 'Cancel',
          onPressed: () {},
          minWidth: 80,
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
