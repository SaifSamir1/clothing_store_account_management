import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/models/customer_productions_details_model.dart';
import 'package:account_mangment_responsive/features/customer_detailes/data/repositry/customer_details_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/caching/hive/my_box.dart';

class CustomerDetailsRepoImpl extends CustomerDetailsRepo {
  @override
  Future<Either<Exception, CustomerProductDetailsModel>> getCustomerDetailsBody(
      {required String customerId}) async {
    try {
      List<QueryDocumentSnapshot> docs = [];
      List<AddProductAndDeductionModel> productsAndDeductionDetails = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('countryNames')
              .doc(myBox!.get("dayName"))
              .collection('customers')
              .doc(customerId)
              .collection('productsAndDeduction')
              .orderBy('dateTime')
              .get();
      docs.addAll(querySnapshot.docs);
      for (var products in querySnapshot.docs) {
        productsAndDeductionDetails
            .add(AddProductAndDeductionModel.fromjson(products.data()));
      }
      CustomerProductDetailsModel customerProductDetailsModel =
          CustomerProductDetailsModel(docs: docs, productsAndDeductionDetails: productsAndDeductionDetails);
      return Right(customerProductDetailsModel);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, DocumentSnapshot<Map<String, dynamic>>>>
      getCustomerInfo({required String customerId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('countryNames')
              .doc(myBox!.get("dayName"))
              .collection('customers')
              .doc(customerId)
              .get();
      return Right(querySnapshot);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
