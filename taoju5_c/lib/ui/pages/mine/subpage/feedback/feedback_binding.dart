/*
 * @Description: 意见反馈binding
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:36:01
 * @LastEditTime: 2021-04-19 09:37:31
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_controller.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }
}
