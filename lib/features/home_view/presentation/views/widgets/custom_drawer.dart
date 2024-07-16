import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/custom_auth_button.dart';
import 'package:account_mangment_responsive/features/home_view/data/reposetry/home_repo_impl.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/pdf_cubit/pdf_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/pdf_widgets/create_all_customer_pdf.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constant.dart';
import 'all_money.dart';
import 'change_the_day.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: defaultColor),
                  accountName: Text(
                      BlocProvider.of<HomeCubit>(context).userInfoModel!.name!),
                  accountEmail: Text(BlocProvider.of<HomeCubit>(context)
                      .userInfoModel!
                      .email!),
                ),
                const SizedBox(
                  height: 15,
                ),
                const AllMoney(),
                const SizedBox(
                  height: 10,
                ),
                const ChangeTheDay(),
                const SizedBox(
                  height: 10,
                ),
                BlocProvider(
                    create: (context) => PdfCubit(HomeRepoImpl()),
                    child: const CreateAllCustomerPdf()),
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                CustomButton(
                  text: S.of(context).SignOut,
                  onPressed: () {},
                  minWidth: 80,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
