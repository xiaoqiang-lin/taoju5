/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:31:19
 * @LastEditTime: 2021-05-06 11:13:07
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/cart/cart_page.dart';
import 'package:taoju5_c/ui/pages/category/category_page.dart';
import 'package:taoju5_c/ui/pages/home/home_page.dart';
import 'package:taoju5_c/ui/pages/mine/mine_page.dart';
import 'package:taoju5_c/ui/pages/school/school_page.dart';

class BottomNavigationBarItemEntity {
  final String title;
  final String activeIcon;
  final String icon;

  BottomNavigationBarItemEntity(
      {required this.title, required this.activeIcon, required this.icon});
}

class MainController extends GetxController {
  final List<BottomNavigationBarItemEntity> navigationItemEntities = [
    BottomNavigationBarItemEntity(
        title: "首页", activeIcon: R.image.homeActive, icon: R.image.home),
    BottomNavigationBarItemEntity(
        title: "分类",
        activeIcon: R.image.categoryActive,
        icon: R.image.category),
    BottomNavigationBarItemEntity(
        title: "淘学院", activeIcon: R.image.schoolActive, icon: R.image.school),
    BottomNavigationBarItemEntity(
        title: "购物车", activeIcon: R.image.cartActive, icon: R.image.cart),
    BottomNavigationBarItemEntity(
        title: "我的", activeIcon: R.image.mineActive, icon: R.image.mine),
  ];

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    SchoolPage(),
    CartPage(),
    MinePage()
  ];

  int currentIndex = 0;

  void switchTo(int index) {
    currentIndex = index;

    update();
  }
}
