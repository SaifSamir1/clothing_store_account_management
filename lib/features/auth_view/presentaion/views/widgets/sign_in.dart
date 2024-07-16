









import 'package:flutter/material.dart';

import 'auth_section_sign_in.dart';
import 'dont_have_account.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Row(
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 205,),
                ),
                SliverToBoxAdapter(
                  child: AuthSectionSignIn(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 205,),
                ),
              ],
            ),
          ),
          Expanded(
            child: DoNotHaveAccount(),
          ),
        ],
      ),
    );
  }
}

