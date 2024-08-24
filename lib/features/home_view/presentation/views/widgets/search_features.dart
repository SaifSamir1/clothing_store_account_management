import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/home_appbar_leading_widget.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/saerch_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/language_cubit/language_cubit.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/caching/hive/my_box.dart';
import '../../manger/home_cubit.dart';
import 'app_bar_title.dart';

AppBar buildCustomAppBar(
    GlobalKey<ScaffoldState> scaffoldKey, context, Function(String)? onChange) {
  return AppBar(
      elevation: 3.0,
      backgroundColor: defaultColor,
      leading: HomeAppBarLeadingWidget(scaffoldKey: scaffoldKey),
      title: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (BlocProvider.of<HomeCubit>(context).isSearching) {
            return SearchAppBar(
              searchTextController: searchTextController,
              onChanged: onChange,
            );
          } else {
            return BlocBuilder<LanguageCubit, ChangeLanguageState>(
              builder: (context, state) {
                return AppBarTitle(
                  title: myBox!.get("countryName"),
                );
              },
            );
          }
        },
      ),
      centerTitle: true,
      actions: buildAppBarActions(
          searchTextController: searchTextController, context: context));
}

List<Widget> buildAppBarActions(
    {required context, required TextEditingController searchTextController}) {
  return [
    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (BlocProvider.of<HomeCubit>(context).isSearching) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<HomeCubit>(context)
                  .clearSearch(searchTextController: searchTextController);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: Colors.white),
          );
        } else {
          return IconButton(
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).startSearch(
                  context: context, searchTextController: searchTextController);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          );
        }
      },
    ),
  ];
}
