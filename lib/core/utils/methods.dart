import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constant.dart';

void showFlutterToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: defaultColor,
    textColor: Colors.white,
  );
}

void showFlutterToastError(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
  );
}

int getCustomerIndex({required String customerName, required context}) {
  int index = BlocProvider.of<HomeCubit>(context)
      .allCustomersDetails!
      .allCustomer
      .indexWhere((element) => element.customerName!
          .toLowerCase()
          .startsWith(customerName.toLowerCase()));
  return index;
}
