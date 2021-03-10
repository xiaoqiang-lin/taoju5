/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:28
 * @LastEditTime: 2020-12-22 10:02:38
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_edit/customer_edit_controller.dart';

class CustomerEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerEditController());
  }
}
