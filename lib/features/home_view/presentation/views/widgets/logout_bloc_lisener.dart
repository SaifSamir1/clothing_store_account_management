

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/caching/hive/my_box.dart';
import '../../../../../core/widgets/custom_alert_dialoge.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../manger/home_cubit.dart';

class LogOutBlocListener extends StatelessWidget {
  const LogOutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is SignOutSuccess){
          myBox!.put("notShowAuthScreen", "false").then((value) {
            GoRouter.of(context).pushReplacement(Routes.signIn);
          });
        }
      },
      child: CustomButton(
        color: defaultColor,
        text: S.of(context).SignOut,
        onPressed: () async{
          _showCustomDialog(context,() async {
            await context.read<HomeCubit>().logOut();
            GoRouter.of(context).pop();
          });
        },
        minWidth: 80,
      ),
    );
  }
}

void _showCustomDialog(BuildContext context,
    VoidCallback onPositiveButtonPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Use a custom AlertDialog widget
      return CustomAlertDialog(
        isLoading: false,
        title: '',
        content: S.of(context).signUp,
        nameOfPositiveButton: S.of(context).yes,
        nameOfNegativeButton: S.of(context).cansle,
        onPositiveButtonPressed: onPositiveButtonPressed,
        onNegativeButtonPressed: () {
          Navigator.of(context).pop(); // Close the dialog
          // Add custom logic for negative button
        },
      );
    },
  );
}
