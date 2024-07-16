



import 'package:flutter/material.dart';

import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';

class AddCustomerButtons extends StatelessWidget {
  const AddCustomerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Add',
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

