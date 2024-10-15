




import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class AuthRepo
{
  Future<Either<String, UserCredential>> signUp(String emailAddress,String password,context);
  Future<Either<String, UserCredential>> login(String emailAddress,String password, context);

  Future<Either<Exception,String>> storeTheUserInformation({required UserInfoModel infoOfTheUser});
  Future<Either<Exception,String>> storeTheCountryName();

  Future<Either<String,String>> resetPasswordAndSendItToMyEmail(String email,context);

}