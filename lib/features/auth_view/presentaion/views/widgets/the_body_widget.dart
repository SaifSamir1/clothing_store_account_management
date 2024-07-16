


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.dart';
import '../../../data/repositry/auth_repo_impl.dart';
import '../../manger/auth_cubit.dart';
import 'country_name_section.dart';

class TheBodyWidget extends StatelessWidget {
  const TheBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 40,),
        ),
        const SliverToBoxAdapter(
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesLogo),
            radius: 110,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 30,),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
              create: (context) => AuthCubit(AuthRepoImpl()),
              child: const SelectTheDaySection()),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 40,),
        ),
      ],
    );
  }
}
