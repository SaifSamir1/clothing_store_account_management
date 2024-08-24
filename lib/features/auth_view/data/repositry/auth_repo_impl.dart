import 'package:account_mangment_responsive/core/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../generated/l10n.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Exception, UserCredential>> login(
      String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Exception('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Left(Exception('Wrong password provided for that user.'));
      } else {
        return Left(Exception('خطا في كلمة السر او البريد الالكتروني'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> signUp(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Exception('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(Exception('The account already exists for that email.'));
      } else {
        return Left(Exception('something wrong'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
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
  Future<Either<Exception, String>> resetPasswordAndSendItToMyEmail(
      String email,context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right(S.of(context).checkYourEmail);
    } on FirebaseAuthException catch (e) {
      return Left(Exception(e.toString()));
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
