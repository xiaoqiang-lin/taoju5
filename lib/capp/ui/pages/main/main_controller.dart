import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/mine/mine_page.dart';

class CBottomNavigationBarItemEntity {
  final String title;
  final String activeIcon;
  final String icon;

  CBottomNavigationBarItemEntity(
      {@required this.title, @required this.activeIcon, @required this.icon});
}

class CMainController extends GetxController {
  final List<CBottomNavigationBarItemEntity> navigationItemEntities = [
    CBottomNavigationBarItemEntity(
        title: "首页", activeIcon: R.image.homeActive, icon: R.image.home),
    CBottomNavigationBarItemEntity(
        title: "分类",
        activeIcon: R.image.categoryActive,
        icon: R.image.category),
    CBottomNavigationBarItemEntity(
        title: "淘学院", activeIcon: R.image.schoolActive, icon: R.image.school),
    CBottomNavigationBarItemEntity(
        title: "购物车", activeIcon: R.image.cartActive, icon: R.image.cart),
    CBottomNavigationBarItemEntity(
        title: "我的", activeIcon: R.image.mineActive, icon: R.image.mine),
  ];

  final List<Widget> pages = [
    Text("我的"),
    Text("分类"),
    Text("淘学院"),
    Text("购物车"),
    CMinePage()
  ];

  int currentIndex = 0;

  void switchTo(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
