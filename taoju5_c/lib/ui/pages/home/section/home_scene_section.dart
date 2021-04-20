/*
 * @Description:首页场景模块
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-20 10:32:22
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

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
                Text("全部分类", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: (Get.width - R.dimen.dp20 * 2 - R.dimen.dp10) * .6,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: R.dimen.dp20),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: .98,
                      child: Image.network(
                          "https://i.loli.net/2021/04/15/dmbHyWe5DNuc1oA.png"),
                    ),
                    Container(
                      padding: EdgeInsets.all(R.dimen.dp12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("风格分类", style: R.style.h2),
                          Container(
                              margin: EdgeInsets.only(
                                  top: R.dimen.dp3, bottom: R.dimen.dp10),
                              child: Text(
                                "对于定制我们一丝不苟",
                                style: TextStyle(fontSize: R.dimen.sp12),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: R.dimen.dp10,
                                vertical: R.dimen.dp3),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(R.dimen.sp12),
                                color: R.color.brownColor.withOpacity(.7)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "我要选购",
                                  style: TextStyle(
                                      color: R.color.whiteColor,
                                      fontSize: R.dimen.sp13),
                                ),
                                Image.asset(
                                  R.image.next,
                                  color: R.color.whiteColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: (Get.width - R.dimen.dp20 * 2 - R.dimen.dp10) * .4,
                margin: EdgeInsets.only(left: R.dimen.dp10),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Image.network(
                              "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png"),
                          Container(
                            padding: EdgeInsets.all(R.dimen.dp12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "空间分类",
                                  style: TextStyle(
                                      color: R.color.secondAccentColor,
                                      fontSize: R.dimen.sp15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "生活需要更多点缀",
                                  style: TextStyle(
                                    color: R.color.secondAccentColor,
                                    fontSize: R.dimen.sp12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: R.dimen.dp10),
                      child: Stack(
                        children: [
                          Image.network(
                              "https://i.loli.net/2021/04/13/4djlszXmOnRDx7N.png"),
                          Column(
                            children: [
                              Text(
                                "其他分类",
                                style: TextStyle(
                                    color: R.color.secondAccentColor,
                                    fontSize: R.dimen.sp15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "用心打造家居之美",
                                style: TextStyle(
                                    color: R.color.whiteColor,
                                    fontSize: R.dimen.sp15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
