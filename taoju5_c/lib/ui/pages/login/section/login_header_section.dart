import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(R.dimen.sp10),
            border: Border.all(color: Colors.black)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(R.dimen.sp10),
            child: Image.asset("assets/images/logo.png")));
  }
}
