/*
 * @Description: 消息
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:14:12
 * @LastEditTime: 2021-05-19 16:17:41
 */
import 'package:get/get.dart';

import 'order_message_detail_controller.dart';

class OrderMessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderMessageDetailController());
  }
}
