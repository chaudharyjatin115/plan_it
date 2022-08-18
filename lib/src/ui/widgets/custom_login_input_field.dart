import 'package:flutter/material.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class InPutField extends StatelessWidget {
  const InPutField({
    Key? key,
    required this.dark,
    required this.password,
    required this.hint,
  }) : super(key: key);

  final bool dark;
  final bool password;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 380.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: dark ? containerColor : Colors.white,
        ),
        child: TextField(
          style: const TextStyle(color: Colors.grey),
          obscureText: password,
          textAlign: TextAlign.start,
          autocorrect: false,
          autofocus: true,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: hint,
            hintStyle:
                TextStyle(fontSize: 12, color: dark ? Colors.white : textColor),
          ),
        ),
      ),
    );
  }
}
