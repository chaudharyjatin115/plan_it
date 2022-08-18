import 'package:flutter/material.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class ThirdPartySignInButton extends StatelessWidget {
  final String? assetLink;
  final Function()? onTap;
  bool dark;
  ThirdPartySignInButton(
      {Key? key,
      required this.assetLink,
      required this.onTap,
      required this.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: dark ? containerColor : Colors.white12),
        child: Image.asset(assetLink!),
      ),
    );
  }
}
