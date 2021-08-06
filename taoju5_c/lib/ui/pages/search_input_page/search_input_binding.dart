/*
 * @Description: 搜索输入时的页面
 * @Author: iamsmiling
 * @Date: 2021-07-28 10:40:09
 * @LastEditTime: 2021-07-28 11:13:09
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_controller.dart';

class SearchInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchKeywordController());
  }
}
