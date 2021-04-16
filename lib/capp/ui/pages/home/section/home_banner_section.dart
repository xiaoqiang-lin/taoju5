import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/home/home_controller.dart';

class CHomeBannerSection extends StatelessWidget {
  const CHomeBannerSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CHomeController>(builder: (_) {
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
              for (CProductFeatureEntity feature in _.features)
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
