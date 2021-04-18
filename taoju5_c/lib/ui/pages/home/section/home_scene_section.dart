/*
 * @Description:首页场景模块
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-17 18:21:02
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class HomeSceneSection extends StatelessWidget {
  const HomeSceneSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("场景搭配", style: R.style.h2),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
