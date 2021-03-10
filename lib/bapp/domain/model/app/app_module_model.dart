/*
 * @Description: app功能模块
 * @Author: iamsmiling
 * @Date: 2021-01-11 18:03:38
 * @LastEditTime: 2021-01-16 15:01:38
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';

class AppModuleModelListWrapper {
  List<AppModuleModel> appModuleList = [
    AppModuleModel(
        title: '预约测量',
        description: '上门测量，更准确',
        icon: 'measure.png',
        onTap: () => Get.toNamed(BAppRoutes.commitOrder + "/2")),
    AppModuleModel(
        title: '订单管理',
        description: '订单进度一目了然',
        icon: 'order.png',
        onTap: () => Get.toNamed(BAppRoutes.orderList)),
    AppModuleModel(
        title: '客户管理',
        description: '把握客户，把握机会',
        icon: 'customer.png',
        onTap: () => Get.toNamed(BAppRoutes.customerList, arguments: false)),
    AppModuleModel(
        title: '数据中心',
        description: '销售统计,清晰明了',
        icon: 'data_center.png',
        onTap: () => Get.toNamed(BAppRoutes.dashBoard)),
    AppModuleModel(
        title: '设置',
        description: '问题反馈，软件帮助',
        icon: 'settings.png',
        onTap: () => Get.toNamed(BAppRoutes.setting)),
  ];
}

class AppModuleModel {
  String title;
  String description;
  String icon;
  Function onTap;

  AppModuleModel({this.title, this.description, this.icon, this.onTap});
}
