import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:plan_it/src/bloc/auth_bloc/auth_event.dart';
import 'package:plan_it/src/bloc/auth_bloc/auth_state.dart';

import '../../services/auth_services/auth_error.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoggedOut(isLoading: false)) {
    on<AuthEventEmailLogin>((event, emit) async {
      const AuthStateLoggedOut(isLoading: false);
      final email = event.email;
      final password = event.password;
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        final user = credential.user!;
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      } on FirebaseAuthException catch (e) {
        emit(
            AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
      }
    });
    on<AuthEventEmailRegister>((event, emit) async {
      emit(const AuthStateIsInRegistrationView(isLoading: false));
      final email = event.email;
      final password = event.password;
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        final user = credential.user;
        emit(AuthStateLoggedIn(user: user!, isLoading: false));
      } on FirebaseAuthException catch (e) {
        emit(AuthStateIsInRegistrationView(
            isLoading: false, authError: AuthError.from(e)));
      }
    });
    on<AuthEventLogout>(((event, emit) async {
      await FirebaseAuth.instance.signOut();
      emit(const AuthStateLoggedOut(isLoading: false));
    }));
    on<AuthEventGotoRegistration>(
      (event, emit) => emit(
        const AuthStateIsInRegistrationView(isLoading: false),
      ),
    );
    on<AuthEventIsInLogin>((event, emit) {
      emit(const AuthStateIsInLogin(isLoading: false));
    });
    on<AuthEventGoogleSignin>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: false));
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken);
          final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          emit(AuthStateLoggedIn(user: userCredential.user!, isLoading: false));
        }
      } on FirebaseAuthException catch (e) {
        emit(
            AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
      }
    });
    on<AuthEventInitialize>((event, emit) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });
    on<AuthEventIsInAddTaskScreen>(
      (event, emit) {
        emit(const AuthStateIsInAddTaskScreen(isLoading: false));
      },
    );
  }
}
