import 'dart:developer';

import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/repositry/customer_details_repo.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'customer_details_state.dart';

class CustomerDetailsCubit extends Cubit<CustomerDetailsState> {
  CustomerDetailsCubit(this.customerDetailsRepo) : super(CustomerDetailsInitial());

  CustomerDetailsRepo customerDetailsRepo ;

  Future<void> getCustomerDetailsBody(
      {required List<QueryDocumentSnapshot> docs,
        required List<AddProductAndDeductionModel> productsAndDeductionDetails,required String customerId})
  async {
    emit(GetCustomerDetailsLoading());
    var result = await customerDetailsRepo.getCustomerDetailsBody(
      customerId: customerId,
        docs: docs, productsAndDeductionDetails: productsAndDeductionDetails,);
    result.fold((error) {
      log(error.toString());
      emit(GetCustomerDetailsError(errorMessage: error.toString()));
    }, (success) {
      emit(GetCustomerDetailsSuccess());
    });
  }

  late CustomerModel customerInfo;
  Future<void> getCustomerInfo(
      { required String customerId})
  async {
    emit(GetCustomerInfoLoading());
    var result = await customerDetailsRepo.getCustomerInfo(
      customerId: customerId,
      );
    result.fold((error) {
      log(error.toString());
      emit(GetCustomerInfoError(errorMessage: error.toString()));
    }, (customerInfoJson) =>{
      customerInfo = CustomerModel.fromjson(customerInfoJson.data()!),
      emit(GetCustomerInfoSuccess(customerInfo: customerInfo))
    });
  }
}
