part of 'pdf_cubit.dart';

@immutable
abstract class PdfState {}

class PdfInitial extends PdfState {}

class GetLastDateForCustomerPaidLoading extends PdfState {}
class GetLastDateForCustomerPaidSuccess extends PdfState
{
  final List<dynamic> getLastDateForCustomerPaid;

  GetLastDateForCustomerPaidSuccess({required this.getLastDateForCustomerPaid});
}
class GetLastDateForCustomerPaidError extends PdfState {
  final String errorMessage;

  GetLastDateForCustomerPaidError({required this.errorMessage});
}