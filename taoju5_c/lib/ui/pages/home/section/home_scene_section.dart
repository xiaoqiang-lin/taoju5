/*
 * @Description:首页场景模块
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-20 16:36:32
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

class HomeSceneSection extends StatelessWidget {
  const HomeSceneSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = Get.width - R.dimen.dp20 * 2 - R.dimen.dp10;
    double assignableHeight = assignableWidth * .6 * (190 / 185);
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
          Container(
            height: assignableHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: assignableWidth * .6,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: R.dimen.dp20),
                  padding: EdgeInsets.all(R.dimen.dp12),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://i.loli.net/2021/04/15/dmbHyWe5DNuc1oA.png"))),
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
                            horizontal: R.dimen.dp10, vertical: R.dimen.dp3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(R.dimen.sp12),
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
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: R.dimen.dp10),
                  child: Column(
                    children: [
                      Container(
                        width: assignableWidth * .4,
                        height: (assignableHeight - R.dimen.dp10) / 2,
                        padding: EdgeInsets.all(R.dimen.dp12),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://i.loli.net/2021/04/13/67rn3TmJ1Y4RIlu.png"))),
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
                      ),
                      Container(
                        width: assignableWidth * .4,
                        height: (assignableHeight - R.dimen.dp10) / 2,
                        margin: EdgeInsets.only(top: R.dimen.dp10),
                        padding: EdgeInsets.all(R.dimen.dp12),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png"))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "其他分类",
                              style: TextStyle(
                                  color: R.color.whiteColor,
                                  fontSize: R.dimen.sp15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "用心打造家居之美",
                              style: TextStyle(
                                  color: R.color.whiteColor,
                                  fontSize: R.dimen.sp12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}