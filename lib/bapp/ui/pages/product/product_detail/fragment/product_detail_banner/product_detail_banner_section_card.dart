/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-02-20 15:16:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_swiper.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailBannerCard extends StatelessWidget {
  final List<String> imageList;
  const ProductDetailBannerCard({Key key, @required this.imageList})
      : super(key: key);

  String get tag => Get.parameters["id"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      height: Get.width * .96,
      width: Get.width,
      child: XSwiper(
        itemCount: imageList?.length,
        itemWidth: Get.width,
        itemHeight: .8 * Get.width,
        itemBuilder: (BuildContext context, int index) {
          return XPhotoViewer(
              fadeInDuration: const Duration(milliseconds: 75),
              closedShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              fit: BoxFit.fitWidth,
              url: imageList[index]);
        },
      ),
    );
  }
}
