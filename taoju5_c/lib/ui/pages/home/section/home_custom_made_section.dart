/*
 * @Description: 首页布艺定制板块
 * @Author: iamsmiling
 * @Date: 2021-04-15 11:13:42
 * @LastEditTime: 2021-04-15 11:21:14
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class CHomeCustomMadeSection extends StatelessWidget {
  const CHomeCustomMadeSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              children: [
                Text("布艺定制", style: R.style.h2),
              ],
            ),
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
