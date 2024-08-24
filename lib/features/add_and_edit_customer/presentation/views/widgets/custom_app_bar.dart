import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/custom_auth_button.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../home_view/presentation/views/widgets/app_bar_title.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      this.actionIcon,
      required this.backButtonOnPressed,
      this.actionButtonOnPressed});
  final String title;
  final IconData icon;
  final IconData? actionIcon;
  final VoidCallback backButtonOnPressed;
  final VoidCallback? actionButtonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 5),
      color: defaultColor,
      width: double.infinity,
      child: Row(
        children: [
          BackButton(
            color: Colors.white,
            onPressed: backButtonOnPressed,
          ),
          const Flexible(
              child: SizedBox(
            width: 600,
          )),
          AppBarTitle(
            title: title,
          ),
          const Flexible(
              child: SizedBox(
            width: 600,
          )),
          if (actionIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: CustomButton(
                buttonHeight: 37,
                iconColor: Colors.white,
                text: S.of(context).edit,
                onPressed: actionButtonOnPressed ?? () {},
                minWidth: 60,
                icon: Icons.edit,
              ),
            ),
        ],
      ),
    );
  }
}


AppBar buildCustomAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? action,
}) {
  return AppBar(
    leading: BackButton(
      color: Colors.white,
      onPressed: (){
        GoRouter.of(context).pop();
      },
    ),
    backgroundColor: defaultColor,
    title:AppBarTitle(title: title),
    actions:action ,
  );
}
