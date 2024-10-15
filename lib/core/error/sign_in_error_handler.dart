
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SignInErrorHandler {
  String handleFirebaseAuthError(FirebaseAuthException e, BuildContext context) {
    switch (e.code) {
      case 'user-not-found':
        return S.of(context).user_not_found;
      case 'wrong-password':
        return S.of(context).wrong_password;
      case 'invalid-email':
        return S.of(context).invalid_email;
      case 'user-disabled':
        return S.of(context).user_disabled;
      case 'too-many-requests':
        return S.of(context).too_many_requests;
      case 'operation-not-allowed':
        return S.of(context).operation_not_allowed;
      case 'invalid-credential':
        return S.of(context).invalid_credential;
      default:
        return S.of(context).unknown_error(e.message.toString());
    }
  }
}
