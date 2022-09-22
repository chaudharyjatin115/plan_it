import 'package:flutter/foundation.dart' show immutable;

// base class
@immutable
abstract class AuthEvent {}

@immutable
class AuthEventEmailLogin implements AuthEvent {
  final String email;
  final String password;
  const AuthEventEmailLogin({required this.email, required this.password});
}

@immutable
class AuthEventEmailRegister implements AuthEvent {
  final String email;
  final String password;
  const AuthEventEmailRegister({required this.email, required this.password});
}

@immutable
class AuthEventLogout implements AuthEvent {
  const AuthEventLogout();
}

@immutable
class AuthEventGotoLogin implements AuthEvent {
  const AuthEventGotoLogin();
}

@immutable
class AuthEventGotoRegistration implements AuthEvent {
  const AuthEventGotoRegistration();
}

@immutable
class AuthEventGoogleSignin implements AuthEvent {
  const AuthEventGoogleSignin();
}

class AuthEventDeleteAccount implements AuthEvent {}

class AuthEventIsInLogin implements AuthEvent {}

class AuthEventInitialize implements AuthEvent {}

class AuthEventIsInAddTaskScreen implements AuthEvent {}
