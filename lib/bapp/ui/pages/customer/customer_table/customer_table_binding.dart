/*
 * @Description: 用户表格
 * @Author: iamsmiling
 * @Date: 2021-02-01 14:27:50
 * @LastEditTime: 2021-02-02 10:47:34
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_table/customer_table_controller.dart';

class CustomerTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerTableController());
  }
}
