/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:16:47
 * @LastEditTime: 2021-06-26 09:36:36
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/carousel/carousel_image_slider.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'dart:math' as math;

import 'package:taoju5_c/res/R.dart';

class ProductDetailBannerSection extends StatelessWidget {
  final ProductDetailEntity product;
  const ProductDetailBannerSection({Key? key, required this.product})
      : super(key: key);

  List<PictureEntity> get images => product.images;

  double get maxAspectRatio {
    double max = 1;
    for (int i = 0; i < images.length; i++) {
      max = math.max(max, images[i].aspectRatio);
    }

    return max;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselImageSlider(
      height: R.dimen.width / maxAspectRatio,
      // width: R.dimen.width,
      // aspectRatio: maxAspectRatio,
      viewportFraction: 1,
      pictures: product.images,
    );
  }
}
