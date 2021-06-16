/*
 * @Description: 收藏夹
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:24:12
 * @LastEditTime: 2021-06-08 16:42:07
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController
    with SingleGetTickerProviderMixin {
  List<String> tabs = ["商店", "门店", "搭配方案", "专题文章"];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }
}
