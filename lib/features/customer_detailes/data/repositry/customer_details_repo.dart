

import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';


abstract class CustomerDetailsRepo {
  Future<Either<Exception, String>> getCustomerDetailsBody(
      {required List<QueryDocumentSnapshot> docs,
        required List<AddProductAndDeductionModel> productsAndDeductionDetails,required String customerId});
  Future<Either<Exception, DocumentSnapshot<Map<String, dynamic>>>> getCustomerInfo(
      { required String customerId});
}
