import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: R.dimen.dp10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "登录即代表同意淘居屋",
            style: TextStyle(color: R.color.ffc7c8cc, fontSize: R.dimen.sp10),
          ),
          Text(
            "隐私政策与用户协议",
            style: TextStyle(color: R.color.ff666666, fontSize: R.dimen.sp10),
          )
        ],
      ),
    );
  }
}
