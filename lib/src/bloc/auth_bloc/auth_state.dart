import 'package:flutter/foundation.dart' show immutable;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan_it/src/services/auth_services/auth_error.dart';

// base class
@immutable
abstract class AuthState {
  final bool isLoading;
  final AuthError? authError;
  final User? user;
  AuthState({required this.isLoading, this.authError, this.user});
}

class AuthStateLoggedIn extends AuthState {
  final User user;

  AuthStateLoggedIn(
      {required this.user, required bool isLoading, AuthError? authError})
      : super(isLoading: isLoading, authError: authError);
}

class AuthStateLoggedOut extends AuthState {
  AuthStateLoggedOut({required bool isLoading, AuthError? authError})
      : super(isLoading: isLoading, authError: authError);
}

class AuthStateIsInRegistrationView extends AuthState {
  AuthStateIsInRegistrationView({required bool isLoading, AuthError? authError})
      : super(isLoading: isLoading, authError: authError);
}
