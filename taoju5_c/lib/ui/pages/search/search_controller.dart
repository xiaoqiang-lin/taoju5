/*
 * @Description: 商品搜索
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:50:59
 * @LastEditTime: 2021-07-15 16:09:58
 */
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

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

class SearchController extends BaseFutureLoadStateController {
  String keyword = '';

  List<String> keyList = [];

  List<String> historyList = [];

  bool focused = false;
  SearchType type = _getSearchTypeFromCode(Get.parameters["search_type"] ?? '');

  late GetStorage box;

  Map<SearchType, Future Function({Map? params})> get loadDataMap => {
        SearchType.product: searchProducts,
        SearchType.order: searchOrder,
        SearchType.article: searchArticle
      };

  Map<SearchType, Future? Function()> get jumpMap => {
        SearchType.product: jumpToProductList,
        SearchType.order: jumpToOrderList,
        SearchType.article: jumpToArticleList
      };

  @override
  Future loadData({Map? params}) {
    return (loadDataMap[type] ?? (_) => Future.value())(params: params);
  }

  ///搜索商品
  Future searchProducts({Map? params}) {
    ProductRepository repository = ProductRepository();

    return repository.keywords().then((value) {
      keyList = value;
    });
  }

  ///搜索订单
  Future searchOrder({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.keywords().then((value) {
      keyList = value;
    });
  }

  ///搜索文章
  Future searchArticle({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.keywords().then((value) {
      keyList = value;
    });
  }

  ///跳转到商品列表
  Future? jumpToProductList() {
    return Get.toNamed(AppRoutes.searchProduct + "/$keyword");
  }

  ///跳转到订单列表
  Future? jumpToOrderList() {
    // return Get.toNamed(AppRoutes.productList, parameters: {"keyword": keyword});
  }

  ///跳转到列表
  Future? jumpToArticleList() {
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

  List<List<String>> get keyOptions {
    if (GetUtils.isNullOrBlank(keyList) ?? true) {
      return [];
    }
    List<List<String>> list = [];
    (keyList.where((e) => e.isCaseInsensitiveContainsAny(keyword)))
        .forEach((e) {
      int startIndex = e.indexOf(RegExp("$keyword", caseSensitive: false));
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

  void onChanged(String val) {
    CommonKit.debounce(() {
      keyword = val;

      update(["keyword"]);
    }, Duration(milliseconds: 375))();
  }

  void onSubmitted(String val) {
    if (val.isEmpty || historyList.contains(val)) return;
    historyList.add(val);
    box.write(type.toString(), historyList);
  }

  @override
  void onInit() {
    super.onInit();
    box = GetStorage(type.toString());
    GetStorage.init(type.toString());
    historyList = (box.read(type.toString()) ?? []).cast<String>();
  }

  void search([String? key]) {
    if (key != null && key.isNotEmpty) {
      keyword = key;
    }
    onSubmitted(keyword);
    (jumpMap[type] ?? (_) {})();
  }

  void onRemove(String val) {
    historyList.remove(val);
    box.write(type.toString(), historyList);
    update();
  }

  void onEmpty() {
    historyList.clear();
    box.erase();
    update();
  }
}
