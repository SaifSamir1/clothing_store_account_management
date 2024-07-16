import 'package:account_mangment_responsive/features/add_and_edit_customer/data/repositry/add_edit_customer_repo.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit(this.addEditCustomerRepo) : super(AddCustomerInitial());
  AddEditCustomerRepo addEditCustomerRepo;

  Future<void> addCustomer({required CustomerModel customerModel}) async
  {
    emit(AddCustomerLoading());
    var result = await addEditCustomerRepo.createNewCustomer(customerModel: customerModel);

    result.fold((error){
      emit(AddCustomerError(errorMessage: error.toString()));
    }, (success) {
      emit(AddCustomerSuccess());
    });
  }

}
