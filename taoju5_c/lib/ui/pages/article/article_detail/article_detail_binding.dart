/*
 * @Description: 文章详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:40:18
 * @LastEditTime: 2021-04-23 09:44:51
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/article/article_detail/article_detail_controller.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailController());
  }
}
