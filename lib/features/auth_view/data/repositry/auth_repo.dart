




import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class AuthRepo
{
  Future<Either<Exception,UserCredential>> signUp(String emailAddress,String password);
  Future<Either<Exception,UserCredential>> login(String emailAddress,String password);

  Future<Either<Exception,String>> storeTheUserInformation({required UserInfoModel infoOfTheUser});
  Future<Either<Exception,String>> storeTheCountryName();

  Future<Either<Exception,String>> resetPasswordAndSendItToMyEmail(String email,context);

}