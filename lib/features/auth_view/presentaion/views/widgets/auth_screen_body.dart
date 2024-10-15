import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/signup_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/dependency_injection/auth.dart';
import '../../manger/auth_cubit.dart';
import 'auth_section.dart';

class AuthScreenBodySignUp extends StatelessWidget {
  const AuthScreenBodySignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SignUpLogo(),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const AuthSectionSignUp(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          ),
        ],
      ),
    );
  }
}
