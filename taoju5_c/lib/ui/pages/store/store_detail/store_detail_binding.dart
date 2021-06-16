/*
 * @Description: 门店详情
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:56:44
 * @LastEditTime: 2021-06-08 16:59:44
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/store/store_detail/store_detail_controller.dart';

class StoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreDetailController());
  }
}
