import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';

class CLoginHeaderSection extends StatelessWidget {
  const CLoginHeaderSection({Key key}) : super(key: key);

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
