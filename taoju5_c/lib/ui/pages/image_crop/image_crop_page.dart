/*
 * @Description: 图片裁剪
 * @Author: iamsmiling
 * @Date: 2021-04-22 18:39:56
 * @LastEditTime: 2021-04-22 18:51:48
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/image_crop/image_crop_controller.dart';

class ImageCropPage extends StatelessWidget {
  const ImageCropPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageCropController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("图片裁剪"),
          ),
          body: Center(
            child: Image.memory(_.buffer),
          ),
        );
      },
    );
  }
}
