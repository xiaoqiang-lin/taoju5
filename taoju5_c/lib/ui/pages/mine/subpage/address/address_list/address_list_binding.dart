/*
 * @Description:地址列表
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-16 09:44:30
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_controller.dart';

class CAddressListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CAddressListController());
  }
}
