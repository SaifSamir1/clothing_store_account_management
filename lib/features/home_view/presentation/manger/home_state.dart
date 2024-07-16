part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AddSearchedCustomer extends HomeState {}

class StartSearch extends HomeState {}

class StopSearch extends HomeState {}

class ClearSearch extends HomeState {}

class ChangeState extends HomeState {}

class GetAllCustomerLoading extends HomeState {}

class GetAllCustomerSuccess extends HomeState {}

class GetAllCustomerError extends HomeState {
  final String errorMessage;

  GetAllCustomerError({required this.errorMessage});
}

class GetUserInfoLoading extends HomeState {}

class GetUserInfoSuccess extends HomeState {}

class GetUserInfoError extends HomeState {
  final String errorMessage;

  GetUserInfoError({required this.errorMessage});
}
