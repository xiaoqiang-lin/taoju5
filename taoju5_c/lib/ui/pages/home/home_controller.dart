/*
 * @Description: 产品特色
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:31:19
 * @LastEditTime: 2021-06-25 14:56:41
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';

class ProductFeatureEntity {
  final String icon;
  final String label;

  const ProductFeatureEntity({required this.icon, required this.label});
}

class HomeController extends ChimeraRefreshController {
  //  final List<String> bottomNavigationBarItems = ["待审核", "待支付", "待发货", "待评价"];
  final List<String> tabs = ["待审核", "待支付", "待发货", "待评价"];

  List<ProductFeatureEntity> features = [
    ProductFeatureEntity(icon: R.image.factory, label: "C2M直连工厂"),
    ProductFeatureEntity(icon: R.image.lamp, label: "智能高效生产"),
    ProductFeatureEntity(icon: R.image.diamond, label: "前沿设计精选"),
    ProductFeatureEntity(icon: R.image.secure, label: "严苛工艺品质"),
  ];

  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();

    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "home");
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "home").loadMore();
  }

  @override
  Future loadData({Map? params}) {
    return Future.value(0);
  }
}
