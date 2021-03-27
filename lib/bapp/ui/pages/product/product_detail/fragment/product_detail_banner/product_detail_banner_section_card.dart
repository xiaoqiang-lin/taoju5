/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-02-20 15:16:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_image_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_swiper.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_gallery.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailBannerCard extends StatelessWidget {
  final List<ProductImageModel> imageList;
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
    );
  }
}
