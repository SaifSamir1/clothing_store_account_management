


import 'package:dartz/dartz.dart';

import '../../../home_view/data/models/customer_model.dart';

abstract class AddEditCustomerRepo
{
  Future<Either<Exception, String>> createNewCustomer({required CustomerModel customerModel});
  Future<Either<Exception, String>> editCustomerInfo({required String customerId, required CustomerModel newData});
}