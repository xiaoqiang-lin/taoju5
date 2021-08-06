/*
 * @Description: 商品搜索
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:50:59
 * @LastEditTime: 2021-07-28 15:11:00
 */
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/storage/storage_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

///搜索类型
enum SearchType { product, order, article }

SearchType _getSearchTypeFromCode(String code) {
  return {
        '1': SearchType.product,
        '2': SearchType.order,
        '3': SearchType.article
      }[code] ??
      SearchType.product;
}

class SearchController extends ChimeraRefreshController {
  String keyword = '';

  List<String> historyList = [];

  List<String> hotKeywords = [];

  bool focused = false;
  SearchType type = _getSearchTypeFromCode(Get.parameters["search_type"] ?? '');

  late SharedPreferences sp;

  String get searchTip => searchTipMap[type] ?? "搜索您想找的内容";

  Map<SearchType, String> get searchTipMap => {
        SearchType.order: "搜索我的订单",
        SearchType.product: "搜索您想找的内容",
        SearchType.article: "搜索您想找的内容"
      };

  Map<SearchType, Future Function({Map? params})> get loadDataMap => {
        SearchType.product: searchProducts,
        SearchType.order: searchOrder,
        SearchType.article: searchArticle
      };

  Map<SearchType, Future? Function(String)> get _jumpMap => {
        SearchType.product: jumpToProductList,
        SearchType.order: jumpToOrderList,
        SearchType.article: jumpToArticleList
      };

  jump(String key) {
    print("点击进行页面跳转");
    return (_jumpMap[type] ?? (_) {})(key);
  }

  @override
  Future loadData({Map? params}) {
    return (loadDataMap[type] ?? (_) => Future.value())(params: params);
  }

  ///搜索商品
  Future searchProducts({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.hotKeywords().then((value) {
      hotKeywords = value;
      print(hotKeywords);
    });
  }

  ///搜索订单
  Future searchOrder({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.keywords().then((value) {
      // keyList = value;
    });
  }

  ///搜索文章
  Future searchArticle({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.keywords().then((value) {
      // keyList = value;
    });
  }

  ///跳转到商品列表
  Future? jumpToProductList(String key) {
    return Get.toNamed(AppRoutes.category + AppRoutes.productList,
        parameters: {"keyword": key},
        arguments: CategoryEntity(id: -1, name: "搜索商品"));
    // return Get.toNamed(AppRoutes.searchProduct, parameters: {"keyword": key});
  }

  ///跳转到订单列表
  Future? jumpToOrderList(String key) {
    return Get.toNamed(AppRoutes.searchOrder, parameters: {"keyword": keyword});
  }

  ///跳转到列表
  Future? jumpToArticleList(String key) {
    // return Get.toNamed(AppRoutes, parameters: {"keyword": keyword});
  }

  focus() {
    focused = true;
    update();
  }

  unfocus() {
    focused = false;
    update();
  }

  void onChanged(String val) {
    CommonKit.debounce(() {
      keyword = val;
      Get.find<SearchKeywordController>().setKeyWord(val);
    }, Duration(milliseconds: 375))();
  }

  void onSubmitted(String val) {
    if (val.isEmpty || historyList.contains(val)) return;
    historyList.add(val);
    sp.setStringList(type.toString(), historyList);
  }

  @override
  void onInit() {
    sp = StorageManager().sharedPreferences;
    historyList = sp.getStringList(type.toString()) ?? [];
    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "$type");
    Get.lazyPut(() => SearchKeywordController());
    super.onInit();
  }

  void search([String? key]) {
    if (key != null && key.isNotEmpty) {
      keyword = key;
    }
    onSubmitted(keyword);
    (_jumpMap[type] ?? (_) {})(key ?? "");
  }

  void onRemove(String val) {
    historyList.remove(val);
    sp.setStringList(type.toString(), historyList);
    update();
  }

  void onEmpty() {
    historyList.clear();
    sp.clear();
    update();
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "$type").loadMore();
  }

  @override
  void onClose() {
    Get.delete<CommendationController>(tag: "$type", force: true);
    Get.delete<SearchController>(force: true);
    Get.delete<SearchKeywordController>(force: true);
    super.onClose();
  }
}
