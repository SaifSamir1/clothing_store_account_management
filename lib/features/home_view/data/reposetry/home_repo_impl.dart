import 'package:account_mangment_responsive/features/auth_view/data/models/user_model.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/all_customers_details.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:account_mangment_responsive/features/home_view/data/reposetry/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/caching/hive/my_box.dart';
import '../../../add_product_and_deduction/data/models/product_model.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Exception, AllCustomersDetails>> getAllCustomer() async {
    try {
      List<CustomerModel> allCustomer = [];
      List<QueryDocumentSnapshot> docs = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('countryNames')
              .doc(myBox!.get("dayName"))
              .collection('customers')
              .orderBy('dateTime')
              .get();
      docs.addAll(querySnapshot.docs);
      for (var customer in querySnapshot.docs) {
        allCustomer.add(CustomerModel.fromjson(customer.data()));
      }
      AllCustomersDetails allCustomersDetails =
          AllCustomersDetails(allCustomer: allCustomer, docs: docs);
      return Right(allCustomersDetails);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, DateTime>> getCustomerLastPaidDate(
      {required String customerId}) async {
    try {
      List<AddProductAndDeductionModel> customersLastPaidDate = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('countryNames')
              .doc(myBox!.get("dayName"))
              .collection('customers')
              .doc(customerId)
              .collection('productsAndDeduction')
              .where("paidOrProduct", isEqualTo: 'paid')
              .orderBy('dateTime')
              .get();
      for (var products in querySnapshot.docs) {
        customersLastPaidDate
            .add(AddProductAndDeductionModel.fromjson(products.data()));
      }
      return Right(customersLastPaidDate.last.dateTime!);
    } catch (e) {
      return Left(Exception('No Paid'));
    }
  }

  @override
  Future<Either<Exception, UserInfoModel>> getUserDetails() async {
    try {
      UserInfoModel userInfoModel;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      userInfoModel = UserInfoModel.fromjson(userData.data()!);
      return Right(userInfoModel);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
