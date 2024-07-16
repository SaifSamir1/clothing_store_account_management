import 'package:account_mangment_responsive/features/home_view/data/models/all_customers_details.dart';
import 'package:dartz/dartz.dart';
import '../../../auth_view/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Exception, AllCustomersDetails>> getAllCustomer();
  Future<Either<Exception, DateTime>> getCustomerLastPaidDate(
      {required String customerId});
  Future<Either<Exception, UserInfoModel>> getUserDetails();
}
