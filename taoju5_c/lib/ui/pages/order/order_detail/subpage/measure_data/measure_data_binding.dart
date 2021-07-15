/*
 * @Description: 测装数据
 * @Author: iamsmiling
 * @Date: 2021-06-28 16:40:50
 * @LastEditTime: 2021-06-28 16:42:22
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_controller.dart';

class MeasureDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeasureDataController());
  }
}
