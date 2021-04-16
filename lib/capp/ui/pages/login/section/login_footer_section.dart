import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';

class CLoginFooterSection extends StatelessWidget {
  const CLoginFooterSection({Key key}) : super(key: key);

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
            style: TextStyle(color: R.color.hintColor, fontSize: R.dimen.sp10),
          ),
          Text(
            "隐私政策与用户协议",
            style: TextStyle(
                color: R.color.secondPrimaryTextColor, fontSize: R.dimen.sp10),
          )
        ],
      ),
    );
  }
}
