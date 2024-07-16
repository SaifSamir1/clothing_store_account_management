import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../manger/auth_cubit.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({
    super.key,
    required this.validateKey,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> validateKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.validateKey,
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
          CustomTextFormField(
            hintText: S.of(context).fullname,
            controller: widget.nameController,
            keyBoardType: TextInputType.name,
            valedate: (value) {
              if (value!.isEmpty) {
                return S.of(context).nameRe;
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
