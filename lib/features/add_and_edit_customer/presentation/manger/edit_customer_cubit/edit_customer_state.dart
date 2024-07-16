part of 'edit_customer_cubit.dart';

@immutable
abstract class EditCustomerState {}

class EditCustomerInitial extends EditCustomerState {}



class EditCustomerLoading extends EditCustomerState {}

class EditCustomerSuccess extends EditCustomerState {}

class EditCustomerError extends EditCustomerState
{
  final String errorMessage ;

  EditCustomerError({required this.errorMessage});
}
