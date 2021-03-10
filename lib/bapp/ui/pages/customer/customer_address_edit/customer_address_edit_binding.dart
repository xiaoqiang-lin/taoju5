/*
 * @Description: 修改用户地址
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:23:39
 * @LastEditTime: 2021-01-08 10:25:46
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_address_edit/customer_address_edit_controller.dart';

class CustomerAddressEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerAddressEditController());
  }
}
