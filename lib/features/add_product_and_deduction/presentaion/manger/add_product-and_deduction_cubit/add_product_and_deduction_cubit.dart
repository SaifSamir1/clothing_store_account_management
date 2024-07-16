
import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:account_mangment_responsive/features/add_product_and_deduction/data/repositry/add_product_and_deduction_repo.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:bloc/bloc.dart';

import 'add_product_and_deduction_state.dart';

class AddProductAndDeductionCubit extends Cubit<AddProductAndDeductionState> {
  AddProductAndDeductionCubit(this.addProductAndDeductionRepo) : super(AddProductInitial());

  AddProductAndDeductionRepo addProductAndDeductionRepo;
  Future<void> addProductAndDeduction(
      {required AddProductAndDeductionModel addProductAndDeductionModel,
      required String customerId,
      }) async {
    emit(AddProductLoading());
    var result = await addProductAndDeductionRepo.addProductAndDeduction(
        addProductAndDeductionModel: addProductAndDeductionModel,
        customerId: customerId);
    result.fold((error) {
      emit(AddProductError(errorMessage: error.toString()));
    }, (success) {
      emit(AddProductSuccess());
    });
  }

  Future<void> changeCustomerMoney(
        {required CustomerModel newData,
        required String customerId,
      }) async {
    emit(ChangeCustomerMoneyLoading());
    var result = await addProductAndDeductionRepo.upDateCustomerMoney(
        newData: newData,
        customerId: customerId);
    result.fold((error) {
      emit(ChangeCustomerMoneyError(errorMessage: error.toString()));
    }, (success) {
      emit(ChangeCustomerMoneySuccess());
    });
  }

}
