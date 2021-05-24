/*
 * @Description: 活动中心
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:49:36
 * @LastEditTime: 2021-05-19 16:50:31
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/message/subpage/activity_message/activity_message_controller.dart';

class ActivityMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityMessageController());
  }
}
