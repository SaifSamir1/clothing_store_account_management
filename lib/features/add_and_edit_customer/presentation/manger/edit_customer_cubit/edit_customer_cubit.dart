import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home_view/data/models/customer_model.dart';
import '../../../data/repositry/add_edit_customer_repo.dart';

part 'edit_customer_state.dart';

class EditCustomerCubit extends Cubit<EditCustomerState> {
  EditCustomerCubit(this.addEditCustomerRepo) : super(EditCustomerInitial());

  AddEditCustomerRepo addEditCustomerRepo;

  Future<void> editCustomerInformation(
      {required String customerId, required CustomerModel newData}) async {
    emit(EditCustomerLoading());
    var result = await addEditCustomerRepo.editCustomerInfo(
      customerId: customerId,
      newData: newData,
    );
    result.fold((error) {
      emit(EditCustomerError(errorMessage: error.toString()));
    }, (success) {
      emit(EditCustomerSuccess());
    });
  }
}
