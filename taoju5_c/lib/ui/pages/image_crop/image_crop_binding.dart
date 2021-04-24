/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-22 18:42:43
 * @LastEditTime: 2021-04-22 18:49:18
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/image_crop/image_crop_controller.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropBinding extends Bindings {
  @override
  void dependencies() {
    assert(Get.arguments is PickedFile);
    Get.lazyPut(() => ImageCropController(Get.arguments));
  }
}
