/*
 * @Description: 搜索bingding
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:26:09
 * @LastEditTime: 2021-01-07 14:29:00
 */

import 'package:get/get.dart';

import 'search_controller.dart';

class SeacrhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
