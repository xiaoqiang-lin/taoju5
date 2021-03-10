/*
 * @Description:CustomerDetailBinding
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:28:24
 * @LastEditTime: 2020-12-22 15:44:54
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerDetailController());
  }
}
