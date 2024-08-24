part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class ChangePasswordVisibilityState extends AuthState {}
class ChangeDropDownButtonState extends AuthState {}


class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState
{
  final String errorMessage;

  SignUpError({required this.errorMessage});
}


class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInError extends AuthState
{
  final String errorMessage;

  SignInError({required this.errorMessage});
}


class StoreCountryLoading extends AuthState {}

class StoreCountrySuccess extends AuthState {}

class StoreCountryError extends AuthState
{
  final String errorMessage;

  StoreCountryError({required this.errorMessage});
}

class ResetPasswordAndSendItToMyEmailErrorState extends AuthState{
  final String errorMessage;

  ResetPasswordAndSendItToMyEmailErrorState(this.errorMessage);
}
class ResetPasswordAndSendItToMyEmailSuccessState extends AuthState{}
class ResetPasswordAndSendItToMyEmailLoadingState extends AuthState{}
