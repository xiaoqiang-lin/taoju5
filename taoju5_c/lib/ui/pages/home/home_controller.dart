/*
 * @Description: 产品特色
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:31:19
 * @LastEditTime: 2021-06-11 18:08:16
 */
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';

class ProductFeatureEntity {
  final String icon;
  final String label;

  const ProductFeatureEntity({required this.icon, required this.label});
}

class HomeController extends GetxController {
  //  final List<String> bottomNavigationBarItems = ["待审核", "待支付", "待发货", "待评价"];
  final List<String> tabs = ["待审核", "待支付", "待发货", "待评价"];

  List<ProductFeatureEntity> features = [
    ProductFeatureEntity(icon: R.image.factory, label: "C2M直连工厂"),
    ProductFeatureEntity(icon: R.image.lamp, label: "智能高效生产"),
    ProductFeatureEntity(icon: R.image.diamond, label: "前沿设计精选"),
    ProductFeatureEntity(icon: R.image.secure, label: "严苛工艺品质"),
  ];
}
