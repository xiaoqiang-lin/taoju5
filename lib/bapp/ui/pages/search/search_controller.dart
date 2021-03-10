/*
 * @Description: 搜索页面controller
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:44
 * @LastEditTime: 2021-02-02 16:42:57
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoju5/bapp/domain/model/search/search_model.dart';
import 'package:taoju5/bapp/domain/repository/search/search_repository.dart';
import 'dart:math' as math;

enum SearchType { customer, order, product }

class SearchController extends GetxController {
  ///[记录搜索历史和用户信息
  SharedPreferences _sp;
  List<String> keyList = [];
  Map<SearchType, List<String>> _searchHistory = {
    SearchType.customer: <String>[],
    SearchType.order: <String>[],
    SearchType.product: <String>[],
  };

  Map<SearchType, String> _searchTip = {
    SearchType.customer: "搜索客户",
    SearchType.product: "搜索款号或关键词",
    SearchType.order: "搜索订单",
  };

  bool isHistoryVisible = true;

  int get visibleCount => math.min(5, keyList.length);

  List<String> get visibleKeyList => keyList.sublist(0, visibleCount);

  List<String> get unvisibleKeyList => keyList.sublist(visibleCount);

  SearchType get type => Get.arguments;
  String get hintText => _searchTip[type];
  List<String> get historyList {
    print(type);
    print(_searchHistory[type]);
    return _searchHistory[type] ?? [];
  }

  TextEditingController textEditingController;

  @override
  void onInit() {
    _init();
    textEditingController = TextEditingController();
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController?.dispose();
    super.onClose();
  }

  void _init() async {
    _sp = await SharedPreferences.getInstance();
    _sync();
  }

  void addSearchItem(String data) {
    print(data);
    print(historyList);
    historyList.add(data);
    print("+++___");
    print(historyList);
    print("添加搜索记录");
    _persist();

    ///刷新搜索记录
    update(["history"]);
  }

  Future loadData() {
    SearchRepository repository = SearchRepository();
    return repository.search().then((SearchModel value) {
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
    print(_searchHistory[type]);

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
}
