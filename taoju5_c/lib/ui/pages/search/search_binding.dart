/*
 * @Description: 搜索
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:51:27
 * @LastEditTime: 2021-05-17 14:54:27
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
