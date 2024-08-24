




import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_in_header.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/sign_up_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repositry/auth_repo_impl.dart';
import '../../manger/auth_cubit.dart';
import 'auth_section_sign_in.dart';
import 'dont_have_account.dart';

class AuthScreenBodySignIn extends StatelessWidget {
  const AuthScreenBodySignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
    );
  }
}



