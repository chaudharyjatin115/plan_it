import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

import 'package:plan_it/src/ui/widgets/custom_login_input_field.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InPutField(
                dark: dark,
                password: false,
                hint: 'enter your email',
              ),
              SizedBox(
                height: 20,
              ),
              InPutField(
                dark: dark,
                password: true,
                hint: 'enter your password',
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 360,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: dark ? containerColor : Colors.white),
                  child: TextButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: dark ? Colors.white : textColor),
                    ),
                    onPressed: (() {}),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              TextButton(
                onPressed: (() {}),
                child: Text(
                  'new here? sign up',
                  style: TextStyle(color: dark ? Colors.white : textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
