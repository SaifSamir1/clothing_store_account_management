import 'package:account_mangment_responsive/core/utils/global_variable.dart';
import 'package:account_mangment_responsive/features/auth_view/data/models/user_model.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/all_customers_details.dart';
import 'package:account_mangment_responsive/features/home_view/data/reposetry/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/models/customer_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  HomeRepo homeRepo;
  bool isSearching = false;
  late AllCustomersDetails allCustomersDetails;

  Future<void> getAllCustomers() async {
    emit(GetAllCustomerLoading());
    var result = await homeRepo.getAllCustomer();
    result.fold((error) {
      emit(GetAllCustomerError(errorMessage: error.toString()));
    }, (customers) {
      allCustomersDetails = customers;
      emit(GetAllCustomerSuccess());
    });
  }

  void addSearchedForItemsToSearchedList(
      String searchedCharacter, List<CustomerModel> customers) {
    searchedForCharacters = customers
        .where((character) =>
            character.customerName!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    emit(AddSearchedCustomer());
  }

  void startSearch(
      {required context, required TextEditingController searchTextController}) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      stopSearching(searchTextController: searchTextController);
    }));
    isSearching = true;
    emit(StartSearch());
  }

  void stopSearching({required TextEditingController searchTextController}) {
    clearSearch(searchTextController: searchTextController);
    isSearching = false;
    emit(StopSearch());
  }

  void clearSearch({required TextEditingController searchTextController}) {
    searchTextController.clear();
    emit(ClearSearch());
  }

  void changeState() {
    emit(ChangeState());
  }

  UserInfoModel? userInfoModel;
  Future<void> getUserDetails() async {
    emit(GetUserInfoLoading());
    var result = await homeRepo.getUserDetails();
    result.fold((error) {
      emit(GetUserInfoError(errorMessage: error.toString()));
    }, (userInfo) {
      userInfoModel = userInfo;
      emit(GetUserInfoSuccess());
    });
  }

  Future<void> logOut() async
  {
    emit(SignOutLoading());
    await FirebaseAuth.instance.signOut().then((value){
      emit(SignOutSuccess());
    });
  }
}
