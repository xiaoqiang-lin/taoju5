/*
 * @Description: 商品评论列表
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:21:12
 * @LastEditTime: 2021-04-27 16:47:11
 */
import 'package:get/get.dart';

import 'product_comment_list_controller.dart';

class ProductCommentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductCommentListController());
  }
}
