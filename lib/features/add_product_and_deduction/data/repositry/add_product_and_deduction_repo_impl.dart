import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/caching/hive/my_box.dart';
import '../models/product_model.dart';
import 'add_product_and_deduction_repo.dart';

class AddProductAndDeductionRepoImpl extends AddProductAndDeductionRepo {
  @override
  Future<Either<Exception, String>> addProductAndDeduction(
      {required AddProductAndDeductionModel addProductAndDeductionModel,
      required String customerId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('countryNames')
          .doc(myBox!.get("dayName"))
          .collection('customers')
          .doc(customerId)
          .collection('productsAndDeduction')
          .doc()
          .set(addProductAndDeductionModel.toJson());
      return const Right('Success Process');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String>> upDateCustomerMoney(
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
      return const Right('Updated Customer information is Successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
