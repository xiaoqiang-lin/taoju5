/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:16:47
 * @LastEditTime: 2021-06-10 17:17:39
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/carousel/carousel_slide.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'dart:math' as math;

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
    return CarouselSlide(
      itemCount: product.images.length,
      viewportFraction: 1,
      itemHeight: R.dimen.width * (1 / maxAspectRatio),
      itemWidth: R.dimen.width,
      bigImages: product.images.map((e) => e.bigImage).toList(),
      thunmbnails: product.images.map((e) => e.cover).toList(),
      itemBuilder: (BuildContext context, int i) {
        PictureEntity item = product.images[i];
        return ChimeraImage(
          item.cover,
          width: R.dimen.width,
          // cache: true,
          // // height: R.dimen.width,
          // heroTag: item.bigImage,
          borderRadius: BorderRadius.zero,
          fit: item.aspectRatio > 1 ? BoxFit.fitWidth : BoxFit.fitHeight,
          // images: product.images.map((e) => e.bigImage).toList(),
        );
      },
    );
  }
}
