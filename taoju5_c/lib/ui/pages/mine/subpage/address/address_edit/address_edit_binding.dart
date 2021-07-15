/*
 * @Description 收货地址编辑
 * @Author: iamsmiling
 * @Date: 2021-04-16 09:17:55
 * @LastEditTime: 2021-04-16 09:27:41
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_controller.dart';

class AddressEditBinding extends Bindings {
  @override
  void dependencies() {
    assert(Get.arguments == null || Get.arguments is AddressEntity);
    Get.lazyPut(() => AddressEditController(currentAddress: Get.arguments));
  }
}