part of 'add_customer_cubit.dart';

@immutable
abstract class AddCustomerState {}

class AddCustomerInitial extends AddCustomerState {}


class AddCustomerLoading extends AddCustomerState {}

class AddCustomerSuccess extends AddCustomerState {}

class AddCustomerError extends AddCustomerState
{
  final String errorMessage ;

  AddCustomerError({required this.errorMessage});
}
