/*
 * @Description: 产品分享
 * @Author: iamsmiling
 * @Date: 2021-01-20 13:22:38
 * @LastEditTime: 2021-01-21 12:43:55
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_controller.dart';

class ProductShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductShareController());
  }
}
