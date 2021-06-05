/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-26 09:33:58
 * @LastEditTime: 2021-05-26 09:43:00
 */

import 'package:get/get.dart';

import 'order_comment_controller.dart';

class OrderCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderCommentController());
  }
}
