/*
 * @Description: 首页轮播图
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-17 18:50:02
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/home/home_controller.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp10),
            child: Image.network(
                "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (ProductFeatureEntity feature in _.features)
                Row(
                  children: [
                    Image.asset(feature.icon),
                    Text(
                      feature.label,
                      style: TextStyle(
                          fontSize: R.dimen.sp9,
                          color: R.color.secondPrimaryTextColor),
                    )
                  ],
                )
            ],
          )
        ],
      );
    });
  }
}
