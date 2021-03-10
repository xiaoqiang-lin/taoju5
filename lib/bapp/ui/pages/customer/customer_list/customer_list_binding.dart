/*
 * @Description:客户列表依赖注入
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:20:21
 * @LastEditTime: 2020-12-21 17:58:00
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';

class CustomerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerListController());
  }
}
