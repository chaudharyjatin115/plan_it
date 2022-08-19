import 'package:flutter/foundation.dart' show immutable;

// base class
@immutable
abstract class AuthEvent {}

@immutable
class AuthEventEmailLogin implements AuthEvent {
  final String email;
  final String password;
  AuthEventEmailLogin({required this.email, required this.password});
}

@immutable
class AuthEventEmailRegister implements AuthEvent {
  final String email;
  final String password;
  AuthEventEmailRegister({required this.email, required this.password});
}

@immutable
class AuthEventLogout implements AuthEvent {
  AuthEventLogout();
}

@immutable
class AuthEventGotoLogin implements AuthEvent {
  AuthEventGotoLogin();
}

@immutable
class AuthEventGotoRegistration implements AuthEvent {
  AuthEventGotoRegistration();
}

@immutable
class AuthEventGoogleSignin implements AuthEvent {
  AuthEventGoogleSignin();
}

class AuthEventDeleteAccount implements AuthEvent {}

class AuthEventIsInLogin implements AuthEvent {}
