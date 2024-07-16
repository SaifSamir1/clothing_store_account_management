


import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/auth_screen_body_sign_in.dart';
import 'package:flutter/material.dart';

class AuthScreenSignIn extends StatelessWidget {
  const AuthScreenSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: AuthScreenBodySignIn(),
      ),
    );
  }
}