import 'package:account_mangment_responsive/core/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/sign_in_error_handler.dart';
import '../../../../core/error/sign_up_error_handeler.dart';
import '../../../../generated/l10n.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {

  final SignUpErrorHandler _signUpErrorHandler;
  final SignInErrorHandler _signInErrorHandler;
  AuthRepoImpl(this._signUpErrorHandler, this._signInErrorHandler);
  @override
  Future<Either<String, UserCredential>> login(
      String emailAddress, String password,context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(_signInErrorHandler.handleFirebaseAuthError(e,context));
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, UserCredential>> signUp(
      String emailAddress, String password,context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(_signUpErrorHandler.handleFirebaseAuthError(e,context));
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }



  @override
  Future<Either<Exception, String>> storeTheUserInformation(
      {required UserInfoModel infoOfTheUser}) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(infoOfTheUser.toJson());

      return const Right('Create user is Successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<String, String>> resetPasswordAndSendItToMyEmail(
      String email,context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right(S.of(context).checkYourEmail);
    } on FirebaseAuthException catch (e) {
      return Left(_signInErrorHandler.handleFirebaseAuthError(e,context));
    } catch (e) {
      return Left(S.of(context).unknown_error(e.toString()));
    }
  }

  List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  @override
  Future<Either<Exception, String>> storeTheCountryName() async {
    try {
      for (int i = 0; i < days.length; i++) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('countryNames')
            .doc(days[i])
            .set({'countryName': days[i]});
      }
      return const Right('Store the Day\'s names is Successfully');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }


}
