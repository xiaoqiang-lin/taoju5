/*
 * @Description: 分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:49:19
 * @LastEditTime: 2021-04-19 16:50:28
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/category/categoty_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
