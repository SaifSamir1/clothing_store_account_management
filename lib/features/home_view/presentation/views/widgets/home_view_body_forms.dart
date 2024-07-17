import 'package:account_mangment_responsive/core/utils/global_variable.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/widgets/search_list_view.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/custome_error_widget.dart';
import '../../manger/home_cubit.dart';
import 'home_list_view.dart';
import 'no_result_founded.dart';

class HomeViewBodyForms extends StatelessWidget {
  const HomeViewBodyForms({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetAllCustomerError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(
                child: CustomErrorWidget(
                    errorMessage: S.of(context).internetError),
              ),
            ),
          );
        }
        if (shouldShowSearchResults(state)) {
          return searchTextController.text.isNotEmpty &&
                  searchedForCharacters.isEmpty
              ? const SliverToBoxAdapter(
                  child: SizedBox(height: 500, child: NoResultFound()))
              : searchTextController.text.isEmpty
                  ? const HomeListView()
                  : const SearchListView();
        }
        if (state is AddSearchedCustomer) {
          BlocProvider.of<HomeCubit>(context).changeState();
          return searchTextController.text.isNotEmpty &&
                  searchedForCharacters.isEmpty
              ? const SliverToBoxAdapter(
                  child: SizedBox(height: 400, child: NoResultFound()))
              : searchTextController.text.isEmpty
                  ? const HomeListView()
                  : const SearchListView();
        }
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

bool shouldShowSearchResults(HomeState state) {
  return state is GetAllCustomerSuccess ||
      state is StartSearch ||
      state is StopSearch ||
      state is ClearSearch ||
      state is ChangeState ||
      state is GetUserInfoSuccess;
}
