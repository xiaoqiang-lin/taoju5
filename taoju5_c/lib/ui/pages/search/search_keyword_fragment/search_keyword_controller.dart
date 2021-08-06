/*
 * @Description: 搜索词
 * @Author: iamsmiling
 * @Date: 2021-07-28 10:42:31
 * @LastEditTime: 2021-07-28 14:43:28
 */
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';

import '../search_controller.dart';

class SearchKeywordController extends BaseFutureLoadStateController {
  List<String> keywords = [];

  String keyword = Get.parameters["keyword"] ?? "";

  SearchType type = SearchType.product;

  Map<SearchType, Future? Function(String)> get _jumpMap => {
        SearchType.product: jumpToProductList,
        SearchType.order: jumpToOrderList,
        SearchType.article: jumpToArticleList
      };

  ///跳转到商品列表
  Future? jumpToProductList(String key) {
    return Get.toNamed(AppRoutes.category + AppRoutes.productList,
        parameters: {"keyword": key},
        arguments: CategoryEntity(id: -1, name: "搜索商品"),
        preventDuplicates: false);
    // return Get.toNamed(AppRoutes.searchProduct, parameters: {"keyword": key});
  }

  ///跳转到订单列表
  Future? jumpToOrderList(String key) {
    return Get.toNamed(AppRoutes.productList, parameters: {"keyword": keyword});
  }

  ///跳转到列表
  Future? jumpToArticleList(String key) {
    // return Get.toNamed(AppRoutes, parameters: {"keyword": keyword});
  }

  @override
  Future loadData({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.keywords().then((value) {
      keywords = value;
    });
  }

  List<List<String>> get keyOptions {
    if (GetUtils.isNullOrBlank(keywords) ?? true) {
      return [];
    }
    List<List<String>> list = [];
    (keywords.where((e) => e.isCaseInsensitiveContainsAny(keyword)))
        .forEach((e) {
      int startIndex = e.indexOf(RegExp("$keywords", caseSensitive: false));
      if (startIndex != -1) {
        List<String> arr = [];
        arr.add(e.substring(0, startIndex));
        int len = e.length > startIndex + keyword.length
            ? startIndex + keyword.length
            : e.length;

        arr.add(e.substring(startIndex, len));
        arr.add(e.substring(len));
        list.add(arr);
      }
    });
    return list;
  }

  setKeyWord(String key) {
    keyword = key;
    update();
  }

  void onChanged(String val) {
    CommonKit.debounce(() {
      setKeyWord(val);
    }, Duration(milliseconds: 375))();
  }

  void onSubmitted(String val) {
    // if (val.isEmpty || historyList.contains(val)) return;
    // historyList.add(val);
    // box.write(type.toString(), historyList);
  }

  void search(String string) {
    Get.back<String>(result: string);
  }
}
