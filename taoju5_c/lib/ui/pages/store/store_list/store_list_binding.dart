/*
 * @Description: 门店列表页
 * @Author: iamsmiling
 * @Date: 2021-07-21 15:38:06
 * @LastEditTime: 2021-07-21 16:18:25
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/store/store_list/store_list_controller.dart';

class StoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreListParentController());
  }
}
