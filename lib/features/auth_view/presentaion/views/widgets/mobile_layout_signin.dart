import 'package:account_mangment_responsive/features/auth_view/data/repositry/auth_repo_impl.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/manger/auth_cubit.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_section_sign_in.dart';
import 'dont_have_account.dart';

class MobileLayoutSignIn extends StatelessWidget {
  const MobileLayoutSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      child:  Row(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 4,
            child: CustomScrollView(
              slivers: [
                const SignInHeader(),
                SliverToBoxAdapter(
                  child: BlocProvider(
                    create: (context) => AuthCubit(AuthRepoImpl()),
                    child: const AuthSectionSignIn(),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: DoNotHaveAccount(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100,),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
