

import 'package:account_mangment_responsive/features/add_product_and_deduction/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/customer_productions_details_model.dart';


abstract class CustomerDetailsRepo {
  Future<Either<Exception, CustomerProductDetailsModel>> getCustomerDetailsBody(
      {required String customerId});
  Future<Either<Exception, DocumentSnapshot<Map<String, dynamic>>>> getCustomerInfo(
      { required String customerId});
}
