
import 'package:account_mangment_responsive/core/extentions/regular_exepretion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manger/auth_cubit.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKeyConfirm,
      child: CustomTextFormField(
        hintText: S.of(context).loginEmail,
        controller: context.read<AuthCubit>().emailConfirm,
        keyBoardType: TextInputType.emailAddress,
        valedate: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).loginEmailVal;
          }
          if (!value.emailValid) {
            return S.of(context).emailValidate;
          }
          return null;
        },
      ),
    );
  }
}

