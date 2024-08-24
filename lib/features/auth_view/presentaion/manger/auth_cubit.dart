import 'dart:developer';
import 'package:account_mangment_responsive/features/auth_view/data/models/user_model.dart';
import 'package:account_mangment_responsive/features/auth_view/data/repositry/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  AuthRepo authRepo;
  final emailConfirm = TextEditingController();
  final formKeyConfirm = GlobalKey<FormState>();
  bool isPasswordShow = true;
  IconData suffix = Icons.visibility_outlined;
  String? selectedName;
  String? dayName;

  void changeDropdownButton(
      {required String? dayShow, required String trueDay}) {
    selectedName = dayShow;
    dayName = trueDay;
    emit(ChangeDropDownButtonState());
  }

  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;

    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  Future<void> signUpAndSaveTheUserInformation({
    required UserInfoModel userInfoModel,
    required String password,
  }) async {
    emit(SignUpLoading());

    var result = await authRepo.signUp(userInfoModel.email!, password);
    result.fold((error) {
      emit(SignUpError(errorMessage: error.toString()));
    }, (credential) async {
      userId = credential.user!.uid;
      await authRepo.storeTheUserInformation(infoOfTheUser: userInfoModel);
      log(userId);
      emit(SignUpSuccess());
    });
  }

  Future<void> login({
    required String password,
    required String email,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.login(email, password);
    result.fold((error) {
      emit(SignInError(errorMessage: error.toString()));
    }, (credential) async {
      userId = credential.user!.uid;
      log(userId);
      emit(SignInSuccess());
    });
  }

  Future<void> addTheCountries() async {
    emit(StoreCountryLoading());
    var result = await authRepo.storeTheCountryName();
    result.fold((error) {
      emit(StoreCountryError(errorMessage: error.toString()));
    }, (successMessage) {
      emit(StoreCountrySuccess());
    });
  }

  Future<void> resetPasswordAndSendItToMyEmail({
    required String email,
    required BuildContext context,
  }) async {
    emit(ResetPasswordAndSendItToMyEmailLoadingState());
    var result = await authRepo.resetPasswordAndSendItToMyEmail(email, context);
    result.fold((error) {
      emit(ResetPasswordAndSendItToMyEmailErrorState(error.toString()));
    }, (credential) {
      emit(ResetPasswordAndSendItToMyEmailSuccessState());
    });
  }
}
