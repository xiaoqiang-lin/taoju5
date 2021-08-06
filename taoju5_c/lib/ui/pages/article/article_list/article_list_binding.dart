/*
 * @Description: 专题推荐列表
 * @Author: iamsmiling
 * @Date: 2021-07-23 16:47:31
 * @LastEditTime: 2021-07-23 16:50:44
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/article/article_list/article_list_controller.dart';

class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleListParentController());
  }
}
