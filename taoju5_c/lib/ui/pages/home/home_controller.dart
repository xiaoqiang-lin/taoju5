import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';

class CProductFeatureEntity {
  final String icon;
  final String label;

  const CProductFeatureEntity({@required this.icon, @required this.label});
}

class CHomeController extends GetxController {
  //  final List<String> bottomNavigationBarItems = ["待审核", "待支付", "待发货", "待评价"];
  final List<String> tabs = ["待审核", "待支付", "待发货", "待评价"];

  List<CProductFeatureEntity> features = [
    CProductFeatureEntity(icon: R.image.factory, label: "C2M直连工厂"),
    CProductFeatureEntity(icon: R.image.lamp, label: "智能高效生产"),
    CProductFeatureEntity(icon: R.image.diamond, label: "前沿设计精选"),
    CProductFeatureEntity(icon: R.image.secure, label: "严苛工艺品质"),
  ];
}
