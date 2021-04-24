/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-22 22:22:08
 * @LastEditTime: 2021-04-22 22:26:10
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/video/video_player_controller.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoController());
  }
}
