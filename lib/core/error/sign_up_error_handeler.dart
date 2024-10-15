

import 'package:firebase_auth/firebase_auth.dart';

import '../../generated/l10n.dart';
class SignUpErrorHandler {
  String handleFirebaseAuthError(FirebaseAuthException e, context) {
    switch (e.code) {
      case 'weak-password':
        return S.of(context).weak_password;
      case 'email-already-in-use':
        return S.of(context).email_already_in_use;
      case 'invalid-email':
        return S.of(context).invalid_email;
      case 'operation-not-allowed':
        return S.of(context).operation_not_allowed;
      case 'too-many-requests':
        return S.of(context).too_many_requests;
      case 'network-request-failed':
        return S.of(context).network_request_failed;
      case 'user-disabled':
        return S.of(context).user_disabled_admin;
      case 'invalid-credential':
        return S.of(context).invalid_credential;
      default:
        return S.of(context).unknown_error(e.message.toString());
    }
  }
}
