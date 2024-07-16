

import 'package:dartz/dartz.dart';

import '../../../home_view/data/models/customer_model.dart';
import '../models/product_model.dart';

abstract class AddProductAndDeductionRepo {
  Future<Either<Exception, String>> addProductAndDeduction({required AddProductAndDeductionModel addProductAndDeductionModel,required String customerId});
  Future<Either<Exception, String>> upDateCustomerMoney({required String customerId, required CustomerModel newData});

}