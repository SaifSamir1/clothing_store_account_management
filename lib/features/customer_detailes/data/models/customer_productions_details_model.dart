

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../add_product_and_deduction/data/models/product_model.dart';

class CustomerProductDetailsModel {
  final List<QueryDocumentSnapshot> docs ;
  final List<AddProductAndDeductionModel> productsAndDeductionDetails ;

  CustomerProductDetailsModel({required this.docs, required this.productsAndDeductionDetails});
}