import 'package:account_mangment_responsive/features/auth_view/presentaion/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';

class SignInTextFields extends StatefulWidget {
  const SignInTextFields(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey});

  final TextEditingController emailController;

  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInTextFields> createState() => _SignInTextFieldsState();
}

class _SignInTextFieldsState extends State<SignInTextFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: S.of(context).loginEmail,
            controller: widget.emailController,
            keyBoardType: TextInputType.emailAddress,
            valedate: (value) {
              if (value!.isEmpty) {
                return S.of(context).loginEmailVal;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomTextFormField(
                hintText: S.of(context).loginPass,
                controller: widget.passwordController,
                keyBoardType: TextInputType.visiblePassword,
                suffixIcon: Icon(BlocProvider.of<AuthCubit>(context).suffix),
                obscuringCharacter: '*',
                obscureText: BlocProvider.of<AuthCubit>(context).isPasswordShow,
                suffixPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .changePasswordVisibility();
                },
                valedate: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).loginPassVal;
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
