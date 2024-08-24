
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_in_text_fields.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_up_header.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'custom_button_signin_bloc_consumer.dart';
import 'forget_bassword_button.dart';

class AuthSectionSignIn extends StatefulWidget {
  const AuthSectionSignIn({super.key});

  @override
  State<AuthSectionSignIn> createState() => _AuthSectionSignInState();
}

class _AuthSectionSignInState extends State<AuthSectionSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignHeader(
          header: S.of(context).login,
        ),
        const SizedBox(
          height: 20,
        ),
        SignInTextFields(
          emailController: emailController,
          passwordController: passwordController,
          formKey: formKey,
        ),
        const SizedBox(
          height: 10,
        ),
        const ForgetPasswordButton(),
        const SizedBox(
          height: 10,
        ),
        CustomButtonSignInBlocConsumer(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
      ],
    );
  }
}
