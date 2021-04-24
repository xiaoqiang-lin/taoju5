/*
 * @Description: 图片裁剪逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-22 18:41:59
 * @LastEditTime: 2021-04-22 18:51:26
 */
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropController extends GetxController {
  PickedFile image;

  late Uint8List buffer;
  ImageCropController(this.image);

  @override
  void onInit() {
    super.onInit();
    _parse(image);
  }

  _parse(PickedFile file) async {
    buffer = await file.readAsBytes();
    update();
  }
}
