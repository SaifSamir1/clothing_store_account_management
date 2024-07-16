import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/hive_service.dart';
import 'add_edit_customer_repo.dart';

class AddEditCustomerRepoImpl extends AddEditCustomerRepo {
  @override
  Future<Either<Exception, String>> createNewCustomer(
      {required CustomerModel customerModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('countryNames')
          .doc(myBox!.get("dayName"))
          .collection('customers')
          .doc()
          .set(customerModel.toJson());
      return const Right('Create customer is Successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String>> editCustomerInfo(
      {required String customerId, required CustomerModel newData}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('countryNames')
          .doc(myBox!.get("dayName"))
          .collection('customers')
          .doc(customerId)
          .update(newData.toJson());
      return const Right('Update customer is Successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
