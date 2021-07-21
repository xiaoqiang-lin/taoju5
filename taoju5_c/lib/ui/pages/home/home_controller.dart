/*
 * @Description: 产品特色
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:31:19
 * @LastEditTime: 2021-07-20 16:54:57
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/home/home_entity.dart';
import 'package:taoju5_c/domain/repository/home_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';

class ProductFeatureEntity {
  final String icon;
  final String label;

  const ProductFeatureEntity({required this.icon, required this.label});
}

class HomeController extends ChimeraRefreshController<HomeEntity> {
  //  final List<String> bottomNavigationBarItems = ["待审核", "待支付", "待发货", "待评价"];
  // final List<String> tabs = ["待审核", "待支付", "待发货", "待评价"];

  late HomeEntity home;

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
  Future<HomeEntity> loadData({Map? params}) {
    HomeRepository repository = HomeRepository();
    return repository.home().then((value) {
      home = value;
      return value;
    });
  }
}
