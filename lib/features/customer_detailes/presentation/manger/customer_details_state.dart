part of 'customer_details_cubit.dart';

@immutable
abstract class CustomerDetailsState {}

class CustomerDetailsInitial extends CustomerDetailsState {}


class GetCustomerDetailsLoading extends CustomerDetailsState {}
class GetCustomerDetailsSuccess extends CustomerDetailsState {}
class GetCustomerDetailsError extends CustomerDetailsState
{
  final String errorMessage;

  GetCustomerDetailsError({required this.errorMessage});
}


class GetCustomerInfoLoading extends CustomerDetailsState {}
class GetCustomerInfoSuccess extends CustomerDetailsState {

  final CustomerModel customerInfo;
  GetCustomerInfoSuccess({required this.customerInfo});

}
class GetCustomerInfoError extends CustomerDetailsState
{
  final String errorMessage;

  GetCustomerInfoError({required this.errorMessage});
}