import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class SignUpLogo extends StatelessWidget {
  const SignUpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 40,),
          CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesLogo),
            radius: 110,
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}


