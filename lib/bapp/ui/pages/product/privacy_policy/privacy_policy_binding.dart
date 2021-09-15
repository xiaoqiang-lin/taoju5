/*
 * @Description: 隐私政策
 * @Author: iamsmiling
 * @Date: 2021-09-15 20:31:38
 * @LastEditTime: 2021-09-15 20:42:45
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/privacy_policy/privacy_policy_controller.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyController());
  }
}
