
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/send_email_button.dart';
import 'package:flutter/cupertino.dart';
import 'back_to_login_button.dart';
import 'forget_password_email.dart';
import 'forget_password_title.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleSection(),
          SizedBox(height: 40),
          EmailInputField(),
          SizedBox(height: 30),
          SendEmailButton(),
          SizedBox(height: 20),
          BackToLoginButton(),
        ],
      ),
    );
  }
}
