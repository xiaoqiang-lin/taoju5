/*
 * @Description: 消息中心
 * @Author: iamsmiling
 * @Date: 2021-05-19 15:44:49
 * @LastEditTime: 2021-05-19 15:45:32
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/message/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}
