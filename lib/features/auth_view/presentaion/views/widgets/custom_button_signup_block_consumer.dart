import 'package:account_mangment_responsive/core/routing/routes.dart';
import 'package:account_mangment_responsive/core/utils/constant.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/hive_service.dart';
import '../../../../../core/utils/methods.dart';
import '../../../data/models/user_model.dart';
import '../../manger/auth_cubit.dart';
import 'custom_auth_button.dart';

class SignUpButtonBlockConsumer extends StatelessWidget {
  const SignUpButtonBlockConsumer({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.validateKey,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final GlobalKey<FormState> validateKey;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          myBox!.put("notShowAuthScreen", "true");
          BlocProvider.of<AuthCubit>(context).addTheCountries();
        }
        if (state is StoreCountrySuccess) {
          showFlutterToastSuccess(S.of(context).signupSuccess);
          GoRouter.of(context).pushReplacement(Routes.selectTheDay);
        }
        if (state is SignUpError) {
          showFlutterToastError(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is SignUpLoading ||
              state is SignUpSuccess ||
              state is StoreCountryLoading,
          text: S.of(context).signup,
          onPressed: () {
            UserInfoModel userInfoModel = UserInfoModel(
              name: nameController.text,
              email: emailController.text,
              userId: userId,
            );
            if (validateKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context)
                  .signUpAndSaveTheUserInformation(
                userInfoModel: userInfoModel,
                password: passwordController.text,
              );
            }
          },
          minWidth: double.infinity,
        );
      },
    );
  }
}
