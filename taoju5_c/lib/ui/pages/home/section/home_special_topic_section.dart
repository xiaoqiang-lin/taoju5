/*
 * @Description:首页专题推荐
 * @Author: iamsmiling
 * @Date: 2021-04-21 11:07:29
 * @LastEditTime: 2021-05-26 14:12:36
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';

class HomeSpecialTopicSection extends StatelessWidget {
  const HomeSpecialTopicSection({Key? key}) : super(key: key);

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
                Text("专题推荐", style: R.style.h2),
                Spacer(),
                Text("更多", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Column(
              children: [
                ChimeraImage(
                    "https://i.loli.net/2021/04/21/4omRiQL9BAKtqrh.png"),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp14),
                  child: ChimeraImage(
                      "https://i.loli.net/2021/04/21/UeBuqy6sDKGOQfX.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
