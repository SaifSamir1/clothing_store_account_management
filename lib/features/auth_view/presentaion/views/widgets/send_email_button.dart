import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../../generated/l10n.dart';
import '../../manger/auth_cubit.dart';

class SendEmailButton extends StatelessWidget {
  const SendEmailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordAndSendItToMyEmailSuccessState) {
          showFlutterToastSuccess(S.of(context).sendNewPasswordSuccess);
        } else if (state is ResetPasswordAndSendItToMyEmailErrorState) {
          showFlutterToastError("Error: ${state.errorMessage}");
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordAndSendItToMyEmailLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          onPressed: () {
            if (context
                .read<AuthCubit>()
                .formKeyConfirm
                .currentState!
                .validate()) {
              context.read<AuthCubit>().resetPasswordAndSendItToMyEmail(
                email: context.read<AuthCubit>().emailConfirm.text,
                context: context,
              );
            } else {
              showFlutterToastError(S.of(context).loginEmailVal);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: defaultColor,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            S.of(context).sendPassword,
            style: AppStyles.styleSemiBold20White(context),
          ),
        );
      },
    );
  }
}
