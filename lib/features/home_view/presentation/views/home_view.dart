import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/custom_drawer.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/home_view_body.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/search_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: buildCustomAppBar(scaffoldKey, context, (searchedCharacter) {
        BlocProvider.of<HomeCubit>(context).addSearchedForItemsToSearchedList(
            searchedCharacter,
            BlocProvider.of<HomeCubit>(context)
                .allCustomersDetails
                .allCustomer);
      }),
      backgroundColor: const Color(0xffFFFFFF),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
