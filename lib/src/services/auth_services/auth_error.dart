import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

Map<String, AuthError> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'no-current-user': AuthErrorNoCurrentUser(),
  // error code in string    //creating a instance of the said class
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-user': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'permission denied': AuthErrorPermissionDenied(),
};

abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  AuthError({required this.dialogTitle, required this.dialogText});
  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown extends AuthError {
  AuthErrorUnknown()
      : super(
            dialogTitle: 'Authentication Error',
            dialogText: 'unknown Authentication Error');
}

@immutable
// this error would be thrown if the user isnt found in databse
class AuthErrorNoCurrentUser extends AuthError {
  AuthErrorNoCurrentUser()
      : super(
            dialogTitle: 'No current user',
            dialogText: ' no current user with this information was found');
}

@immutable
// this error would be thrown if the user hasnt recently logged in
class AuthErrorRequiresRecentLogin extends AuthError {
  AuthErrorRequiresRecentLogin()
      : super(
            dialogTitle: 'Requires Recent Login',
            dialogText:
                'You need to log out and log back in again in order to perform operation');
}

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  AuthErrorOperationNotAllowed()
      : super(
            dialogTitle: 'Operation Not Allowed',
            dialogText:
                ' You cannot register using this method at this moment');
}

@immutable
class AuthErrorUserNotFound extends AuthError {
  AuthErrorUserNotFound()
      : super(
            dialogTitle: 'user not found',
            dialogText: 'The given user was not found on the server');
}

@immutable
class AuthErrorWeakPassword extends AuthError {
  AuthErrorWeakPassword()
      : super(
            dialogTitle: 'Weak Password',
            dialogText: 'Please choose a stronger password');
}

@immutable
class AuthErrorInvalidEmail extends AuthError {
  AuthErrorInvalidEmail()
      : super(
            dialogTitle: 'Invalid Email',
            dialogText: 'Please double check the password and try again');
}

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  AuthErrorEmailAlreadyInUse()
      : super(
            dialogTitle: 'Email already used by other user',
            dialogText: 'Please try other email');
}

@immutable
class AuthErrorPermissionDenied extends AuthError {
  AuthErrorPermissionDenied()
      : super(
            dialogTitle: 'You dont have permission ',
            dialogText: 'user dont have permission ');
}
