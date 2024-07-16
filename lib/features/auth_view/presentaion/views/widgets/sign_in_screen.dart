









import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/shop_header.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_in.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ShopHeader(),
        ),
        Expanded(
          flex: 2,
          child: SignIn(),
        )
      ],
    );
  }
}
