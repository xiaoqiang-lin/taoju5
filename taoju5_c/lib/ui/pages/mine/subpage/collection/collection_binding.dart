/*
 * @Description:收藏夹
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:24:33
 * @LastEditTime: 2021-07-16 15:24:21
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/collection_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/fragment/product_collection_fragment.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionController());
    Get.lazyPut(() => ProdcutCollectionFragmentController());
  }
}
