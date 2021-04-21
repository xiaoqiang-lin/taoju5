/*
 * @Description: 首页布艺定制板块
 * @Author: iamsmiling
 * @Date: 2021-04-15 11:13:42
 * @LastEditTime: 2021-04-21 10:40:26
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

class HomeCustomMadeSection extends StatelessWidget {
  const HomeCustomMadeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = Get.width - R.dimen.dp20 * 2 - R.dimen.dp15;
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Row(
              children: [
                Column(
                  children: [
                    ChimeraImage(
                      imageUrl:
                          "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png",
                      width: assignableWidth / 2,
                      height: assignableWidth / 2 * (3 / 4),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: R.dimen.dp10, bottom: R.dimen.dp12),
                      child: Text(
                        "布艺定制窗帘",
                        style: TextStyle(fontSize: R.dimen.sp13),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp15),
                  child: Column(
                    children: [
                      ChimeraImage(
                        imageUrl:
                            "https://i.loli.net/2021/04/13/4djlszXmOnRDx7N.png",
                        width: assignableWidth / 2,
                        height: assignableWidth / 2 * (3 / 4),
                        fit: BoxFit.fill,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: R.dimen.dp10, bottom: R.dimen.dp12),
                          child: Text("窗纱",
                              style: TextStyle(fontSize: R.dimen.sp13)))
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              padding: EdgeInsets.symmetric(vertical: R.dimen.dp7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(R.dimen.sp7),
                  border: Border.all(color: R.color.ffee9b5f)),
              child: Column(
                children: [
                  Text(
                    "前往预约测量",
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        fontWeight: FontWeight.bold,
                        color: R.color.ffee9b5f),
                  ),
                  Text(
                    "上门测量更准确",
                    style: TextStyle(
                        fontSize: R.dimen.sp10, color: R.color.ffee9b5f),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
