/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-02-20 15:16:24
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/product_image_model.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/widgets/bloc/x_swiper.dart';
import 'package:taoju5_b/ui/widgets/common/x_photo_gallery.dart';

import 'package:taoju5_b/ui/widgets/common/x_photo_viewer.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailBannerCard extends StatelessWidget {
  final List<ProductImageModel> imageList;
  const ProductDetailBannerCard({Key key, @required this.imageList})
      : super(key: key);

  String get tag => Get.parameters["id"];

  double get aspectRatio {
    double val = 1.0;
    if (GetUtils.isNullOrBlank(imageList)) return val;
    for (ProductImageModel image in imageList) {
      val = max(val, image.aspectRatio);
    }
    return val.toPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: Get.width,
    //   margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
    //   child: CarouselSlider(
    //       options: CarouselOptions(
    //           aspectRatio: aspectRatio,
    //           enableInfiniteScroll: false,
    //           viewportFraction: 1,
    //           autoPlay: false),
    //       items: imageList
    //           .map((e) => SizedBox(
    //                 width: Get.width,
    //                 child: XPhotoViewer(
    //                   url: e.imageUrl,
    //                   fit: e.fit,
    //                   width: Get.width,
    //                   placeholderFadeInDuration:
    //                       const Duration(milliseconds: 0),
    //                   fadeInDuration: const Duration(milliseconds: 0),
    //                   placeholder: (BuildContext context, _) {
    //                     return Image.network(
    //                       e.thumbnail,
    //                       fit: e.fit,
    //                     );
    //                   },
    //                   closedShape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.zero),
    //                 ),
    //               ))
    //           .toList()),
    // );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      width: Get.width,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: XSwiper(
          itemCount: imageList?.length,
          itemBuilder: (BuildContext context, int index) {
            return XPhotoViewer(
              placeholderFadeInDuration: const Duration(milliseconds: 0),
              fadeInDuration: const Duration(milliseconds: 0),
              thumbnail: imageList[index].thumbnail,
              fadeOutDuration: const Duration(milliseconds: 375),
              placeholder: (BuildContext context, _) {
                return Image.network(
                  imageList[index].thumbnail,
                  fit: imageList[index].fit,
                );
              },
              closedShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              fit: imageList[index].fit,
              url: imageList[index].imageUrl,
              openBuilder: (BuildContext context, _) {
                return XPhotoGallery(
                  imageList: imageList.map((e) => e.imageUrl).toList(),
                  currentIndex: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
