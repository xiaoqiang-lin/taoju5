/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-02-20 15:16:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      margin: EdgeInsets.only(left: 24, right: 24),
      child: XSwiper(
        itemCount: imageList?.length,
        itemBuilder: (BuildContext context, int index) {
          return XPhotoViewer(fit: BoxFit.fitHeight, url: imageList[index]);
        },
      ),
    );
  }
}
