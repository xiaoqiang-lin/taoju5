/*
 * @Description: 收藏夹
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:45:08
 * @LastEditTime: 2021-01-07 17:52:29
 */
import 'package:get/get.dart';

import 'collection_controller.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionController());
  }
}
