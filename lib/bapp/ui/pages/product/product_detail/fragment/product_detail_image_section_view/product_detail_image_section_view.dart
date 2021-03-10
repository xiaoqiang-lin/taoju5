/*
 * @Description: 详情图
 * @Author: iamsmiling
 * @Date: 2020-12-25 14:02:15
 * @LastEditTime: 2021-01-20 15:03:29
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

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
            return XPhotoViewer(url: imageList[i]);
          },
          itemCount: imageList.length,
        ),
      ),
    );
  }
}
