/*
 * @Description: 首页轮播图
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-07-21 17:59:32
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/carousel/carousel_image_slider.dart';
import 'package:taoju5_c/domain/entity/home/home_ad_entity.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/home/home_controller.dart';

class HomeBannerSection extends StatelessWidget {
  final List<HomeAdEntity> ads;
  const HomeBannerSection({Key? key, required this.ads}) : super(key: key);

  List<PictureEntity> get images => ads
      .map((e) => PictureEntity(
          cover: e.image,
          bigImage: e.image,
          id: "${e.image}",
          thumbnail: e.image))
      .toList();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp10),
            child: CarouselImageSlider(
              aspectRatio: 184 / 375,
              width: R.dimen.width,
              paginationColor: Colors.white,
              viewportFraction: 1.0,
              pictures: images,
            ),
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
                          fontSize: R.dimen.sp9, color: R.color.ff666666),
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
