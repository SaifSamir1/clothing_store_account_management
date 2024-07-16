import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/auth_screen_body.dart';
import 'package:flutter/material.dart';

class AuthScreenSignUp extends StatelessWidget {
  const AuthScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: AuthScreenBodySignUp(),
      ),
    );
  }
}





