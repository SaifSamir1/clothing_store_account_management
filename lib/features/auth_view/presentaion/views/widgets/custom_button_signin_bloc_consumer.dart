import 'package:account_mangment_responsive/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/caching/hive/my_box.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../../generated/l10n.dart';
import '../../manger/auth_cubit.dart';
import 'custom_auth_button.dart';

class CustomButtonSignInBlocConsumer extends StatelessWidget {
  const CustomButtonSignInBlocConsumer({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showFlutterToastSuccess(S.of(context).loginSuccess);
          myBox!.put("notShowAuthScreen", "true");
          GoRouter.of(context).pushReplacement(Routes.selectTheDay);
        }
        if (state is SignInError) {
          showFlutterToastError(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: S.of(context).login,
          isLoading: state is SignInLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).login(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
          minWidth: double.infinity,
        );
      },
    );
  }
}
