import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_up_header.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_up_text_fields.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'custom_button_signup_block_consumer.dart';
import 'have_account.dart';

class AuthSectionSignUp extends StatefulWidget {
  const AuthSectionSignUp({
    super.key,
  });

  @override
  State<AuthSectionSignUp> createState() => _AuthSectionSignUpState();
}

class _AuthSectionSignUpState extends State<AuthSectionSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> validateKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignHeader(
          header: S.of(context).signup,
        ),
        const SizedBox(
          height: 20,
        ),
        SignUpTextFields(
          validateKey: validateKey,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
        ),
        const HaveAccount(),
        SignUpButtonBlockConsumer(
            nameController: nameController,
            emailController: emailController,
            validateKey: validateKey,
            passwordController: passwordController)
      ],
    );
  }
}
