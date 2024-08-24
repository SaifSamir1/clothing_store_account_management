import 'dart:developer';
import 'package:account_mangment_responsive/features/customer_detailes/data/models/customer_productions_details_model.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/repositry/customer_details_repo.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'customer_details_state.dart';

class CustomerDetailsCubit extends Cubit<CustomerDetailsState> {
  CustomerDetailsCubit(this.customerDetailsRepo) : super(CustomerDetailsInitial());

  CustomerDetailsRepo customerDetailsRepo;
  CustomerProductDetailsModel? customerProductDetails ;

  Future<void> getCustomerDetailsBody(
      {required String customerId})
  async {
    emit(GetCustomerDetailsLoading());
    var result = await customerDetailsRepo.getCustomerDetailsBody(
      customerId: customerId,);
    result.fold((error) {
      log(error.toString());
      emit(GetCustomerDetailsError(errorMessage: error.toString()));
    }, (customerProducts) {
      customerProductDetails = customerProducts;
      emit(GetCustomerDetailsSuccess());
    });
  }

  CustomerModel? customerInfo;
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
      emit(GetCustomerInfoSuccess(customerInfo: customerInfo!))
    });
  }
}
