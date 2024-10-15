import 'package:account_mangment_responsive/features/auth_view/presentaion/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/dependency_injection/auth.dart';
import 'auth_section.dart';
import 'have_account.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      child:  Row(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 205,),
                ),
                SliverToBoxAdapter(
                  child: BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: const AuthSectionSignUp(),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 205,),
                ),
              ],
            ),
          ),
          const Expanded(
            child: HaveAccount(),
          ),
        ],
      ),
    );
  }
}

