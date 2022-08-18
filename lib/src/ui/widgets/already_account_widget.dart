import 'package:flutter/material.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class AlreadyAccountWidget extends StatelessWidget {
  final String? primaryText;
  final String? secondaryText;
  final Function()? onTap;
  const AlreadyAccountWidget({
    Key? key,
    required this.primaryText,
    required this.secondaryText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          primaryText!,
          style: TextStyle(color: dark ? Colors.white : textColor),
        ),
        const SizedBox(
          width: 1,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            secondaryText!,
            style: TextStyle(color: containerColor),
          ),
        ),
      ],
    );
  }
}
