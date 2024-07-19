import 'dart:developer';

import 'package:account_mangment_responsive/core/routing/app_router.dart';
import 'package:account_mangment_responsive/core/utils/hive_service.dart';
import 'package:account_mangment_responsive/core/utils/methods.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/manger/auth_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constant.dart';
import 'country_name_header.dart';
import 'country_name_text_fileds.dart';
import 'custom_auth_button.dart';

class SelectTheDaySection extends StatelessWidget {
  const SelectTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SelectTheDayHeader(),
        const SizedBox(
          height: 20,
        ),
        const SelectDayDropDownButton(),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CustomButton(
              color: defaultColor,
              text: S.of(context).Continue,
              onPressed: () {
                if (BlocProvider.of<AuthCubit>(context).selectedName != null) {
                  log(BlocProvider.of<AuthCubit>(context).selectedName!);
                  myBox!.put("countryName",
                      BlocProvider.of<AuthCubit>(context).selectedName!);
                  myBox!.put(
                      "dayName", BlocProvider.of<AuthCubit>(context).dayName!);
                  GoRouter.of(context).pushReplacement(Routes.homeView);
                }
                if (BlocProvider.of<AuthCubit>(context).selectedName == null) {
                  showFlutterToastError(S.of(context).pleaseSelectDay);
                }
              },
              minWidth: double.infinity,
            );
          },
        )
      ],
    );
  }
}
