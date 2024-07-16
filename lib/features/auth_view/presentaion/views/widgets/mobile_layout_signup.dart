import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/signup_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositry/auth_repo_impl.dart';
import '../../manger/auth_cubit.dart';
import 'auth_section.dart';

class MobileLayoutSignUp extends StatelessWidget {
  const MobileLayoutSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              const SignUpLogo(),
              SliverToBoxAdapter(
                child: BlocProvider(
                  create: (context) => AuthCubit(AuthRepoImpl()),
                  child: const AuthSectionSignUp(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100,),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SizedBox()
        ),
      ],
    );
  }
}
