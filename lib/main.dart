import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it/dialogs/show_auth_error.dart';
import 'package:plan_it/firebase_options.dart';

import 'package:plan_it/repositoires/todo_repository.dart';
import 'package:plan_it/src/bloc/auth_bloc/auth_bloc.dart';
import 'package:plan_it/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:plan_it/src/bloc/todo_bloc/todo_event.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/screens/add_task_screen.dart';

import 'package:plan_it/src/ui/screens/home_screen.dart';
import 'package:plan_it/src/ui/screens/loading/loading_screen.dart';
import 'package:plan_it/src/ui/screens/sign_up%20screen.dart';
import 'package:plan_it/src/ui/themes/theme.dart';

import 'src/bloc/auth_bloc/auth_event.dart';
import 'src/bloc/auth_bloc/auth_state.dart';
import 'src/ui/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent // transparent status bar
      ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc()..add(AuthEventInitialize())),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: BlocConsumer<AuthBloc, AuthState>(
          builder: (((context, state) {
            if (state is AuthStateLoggedIn) {
              return HomeScreen();
            } else if (state is AuthStateLoggedOut) {
              return LoginScreen();
            } else if (state is AuthStateIsInRegistrationView) {
              return SignUpScreen();
            } else if (state is AuthStateIsInLogin) {
              return LoginScreen();
            } else if (state is AuthStateIsInAddTaskScreen) {
              return AddTaskScreen();
            } else {
              return Container();
            }
          })),
          listener: ((context, state) {
            if (state.isLoading) {
              return LoadingScreen.instance()
                  .show(context: context, text: 'loading...');
            } else {
              LoadingScreen.instance().hide();
            }
            // we are going to deal with every auth error in one place
            final authError = state.authError;
            if (authError != null) {
              showAuthError(authError: authError, context: context);
            }
          }),
        ),
      ),
    );
  }
}
