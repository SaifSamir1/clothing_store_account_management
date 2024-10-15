import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/forget_password_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/auth.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/l10n.dart';
import '../manger/auth_cubit.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          S.of(context).forgetPassword,
          style: AppStyles.styleMedium24White(context),
        ),
        backgroundColor: defaultColor,
        elevation: 0,
      ),
      body: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const ForgetPasswordScreenBody()),
    );
  }
}





