/*
 * @Description: 详情图
 * @Author: iamsmiling
 * @Date: 2020-12-25 14:02:15
 * @LastEditTime: 2021-01-20 15:03:29
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/ui/widgets/common/x_cached_network_image.dart';
// import 'package:taoju5_b/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailImageSectionView extends StatelessWidget {
  final List<String> imageList;

  const ProductDetailImageSectionView({Key key, @required this.imageList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(imageList),
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return XCachedNetworkImage(
                key: ValueKey(imageList[i]), imageUrl: imageList[i]);
            // return XPhotoViewer(
            //     closedShape:
            //         RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            //     url: imageList[i]);
          },
          itemCount: imageList.length,
        ),
      ),
    );
  }
}
