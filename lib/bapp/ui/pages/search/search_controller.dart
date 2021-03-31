/*
 * @Description: 搜索页面controller
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:44
 * @LastEditTime: 2021-02-02 16:42:57
 */
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoju5/bapp/domain/model/search/search_model.dart';
import 'package:taoju5/bapp/domain/repository/search/search_repository.dart';
import 'dart:math' as math;

import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/extensions/string_kit.dart';
import 'package:taoju5/utils/common_kit.dart';

enum SearchType { customer, order, product }

class SearchController extends GetxController {
  ///[记录搜索历史和用户信息
  SharedPreferences _sp;
  List<String> keyList = [];

  String keyword = "";

  List<List<String>> get keyOptions {
    if (GetUtils.isNullOrBlank(keyList)) {
      return [];
    }
    List<List<String>> list = [];
    if (GetUtils.isNullOrBlank(keyword)) {
      return keyList.map((e) => [e])?.toList();
    }
    keyList.where((e) => e.isCaseInsensitiveContainsAny(keyword)).forEach((e) {
      int startIndex = e.indexOf(RegExp("$keyword", caseSensitive: false));
      if (startIndex != -1) {
        List<String> arr = [];
        arr.add(e.substring(0, startIndex));
        arr.add(e.substring(startIndex, startIndex + keyword?.length));
        arr.add(e.substring(startIndex + keyword?.length));
        list.add(arr);
      }
    });
    return list;
  }

  Map<String, List<String>> _searchHistory = {
    SearchType.customer.index.toString(): <String>[],
    SearchType.order.index.toString(): <String>[],
    SearchType.product.index.toString(): <String>[],
  };

  Map<String, String> _searchTip = {
    SearchType.customer.index.toString(): "搜索客户",
    SearchType.product.index.toString(): "搜索款号或关键词",
    SearchType.order.index.toString(): "搜索订单",
  };

  bool isHistoryVisible = true;

  int get visibleCount => math.min(5, keyOptions.length);

  List<String> get visibleKeyList => keyList.sublist(0, visibleCount);

  List<List<String>> get visibleKeyOptionList =>
      keyOptions.sublist(0, visibleCount);

  List<List<String>> get unvisibleKeyOptionList =>
      keyOptions.sublist(visibleCount);

  List<String> get unvisibleKeyList => keyList.sublist(visibleCount);

  String get type => Get.parameters["searchType"];
  String get hintText => _searchTip[type];
  List<String> get historyList {
    return _searchHistory[type] ?? [];
  }

  @override
  void onInit() {
    _init();

    keyword = Get.parameters["keyword"];
    if (GetUtils.isNullOrBlank(keyword) || keyword == null.toString()) {
      keyword = null;
    }
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _init() async {
    _sp = await SharedPreferences.getInstance();
    _sync();
  }

  void addSearchItem(String data) {
    historyList.add(data);

    _persist();

    ///刷新搜索记录
    update(["history"]);
  }

  Future loadData() {
    if (type != SearchType.product.index.toString()) return Future.value();
    SearchRepository repository = SearchRepository();
    return repository
        .search(params: {"height": Get.parameters["height"] ?? ""}).then(
            (SearchModel value) {
      keyList = value.data;
    });
  }

  void removeSearchItem(String data) {
    historyList.remove(data);
    _persist();

    ///刷新搜索记录
    update(["history"]);
  }

  ///同步数据到内存中
  void _sync() {
    _searchHistory[type] = _sp.getStringList(type.toString());

    ///刷新搜索记录
    update(["history"]);
  }

  ///数据持久化
  void _persist() {
    _sp.setStringList(type.toString(), historyList);
  }

  void clear() {
    historyList?.clear();
    _persist();
    update(["history"]);
    Get.back();
  }

  Future _searchOrder(String keyword) {
    return Get.toNamed(BAppRoutes.searchOrder + "?keyword=$keyword");
  }

  Future _searchCustomer(String keyword) {
    return Get.toNamed(BAppRoutes.searchCustomer + "?keyword=$keyword",
        preventDuplicates: false, arguments: Get.arguments);
  }

  _searchProduct(String keyword) {
    return Get.back(result: keyword.stringDecode());
  }

  void onSearch(String keyword) {
    addSearchItem(keyword);
    keyword = keyword.stringEncode();
    if (type == SearchType.customer.index.toString()) {
      _searchCustomer(keyword);
      return;
    }
    if (type == SearchType.order.index.toString()) {
      _searchOrder(keyword);
      return;
    }
    _searchProduct(keyword);
  }

  void onChanged(String val) {
    CommonKit.debounce(() {
      keyword = val;

      update(["keyword"]);
    }, Duration(milliseconds: 375))();
  }
}
