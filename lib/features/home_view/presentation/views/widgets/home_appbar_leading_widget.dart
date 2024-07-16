import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBarLeadingWidget extends StatelessWidget {
  const HomeAppBarLeadingWidget({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (BlocProvider.of<HomeCubit>(context).isSearching) {
          return const BackButton(
            color: Colors.white,
          );
        } else {
          return IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.dehaze,
                color: Colors.white,
              ));
        }
      },
    );
  }
}
