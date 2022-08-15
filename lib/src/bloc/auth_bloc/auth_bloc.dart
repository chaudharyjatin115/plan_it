import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it/src/bloc/auth_bloc/auth_event.dart';
import 'package:plan_it/src/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateLoggedOut(isLoading: false)) {
    on<AuthEventEmailLogin>((event, emit) {});
  }
}
