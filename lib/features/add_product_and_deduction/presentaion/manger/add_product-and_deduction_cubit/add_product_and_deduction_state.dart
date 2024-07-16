import 'package:flutter/material.dart';

@immutable
abstract class AddProductAndDeductionState {}

class AddProductInitial extends AddProductAndDeductionState {}

class AddProductLoading extends AddProductAndDeductionState {}

class AddProductSuccess extends AddProductAndDeductionState {}

class AddProductError extends AddProductAndDeductionState {
  final String errorMessage;

  AddProductError({required this.errorMessage});
}

class ChangeCustomerMoneyLoading extends AddProductAndDeductionState {}

class ChangeCustomerMoneySuccess extends AddProductAndDeductionState {}

class ChangeCustomerMoneyError extends AddProductAndDeductionState {
  final String errorMessage;

  ChangeCustomerMoneyError({required this.errorMessage});
}
