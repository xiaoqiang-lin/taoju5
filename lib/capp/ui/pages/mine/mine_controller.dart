import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/entity/user/user_entity.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/routes/capp_routes.dart';

class CMineKongoEntity {
  final String label;
  final String icon;
  final Function onTap;
  final int count;
  CMineKongoEntity(
      {@required this.label,
      this.count = 0,
      @required this.icon,
      @required this.onTap});
}

class CMineTileEntity {
  final String label;
  final String icon;
  final Function onTap;

  CMineTileEntity(
      {@required this.label, @required this.icon, @required this.onTap});
}

class CMineController extends GetxController {
  UserEntity user = UserEntity.smaple();

  List<CMineKongoEntity> get kongos => [
        CMineKongoEntity(
            icon: R.image.toBeMeasured, label: "待测量", onTap: () {}),
        CMineKongoEntity(
            icon: R.image.toBeSelected, label: "待选品", count: 12, onTap: () {}),
        CMineKongoEntity(icon: R.image.toBePaid, label: "待付款", onTap: () {}),
        CMineKongoEntity(
            icon: R.image.toBeDelivered, label: "待发货", onTap: () {}),
        CMineKongoEntity(
            icon: R.image.toBeInstalled, label: "待安装", onTap: () {}),
      ];

  List<CMineTileEntity> get tiles => [
        CMineTileEntity(icon: R.image.star, label: "我的收藏", onTap: () {}),
        CMineTileEntity(icon: R.image.footprint, label: "我的足迹", onTap: () {}),
        CMineTileEntity(
            icon: R.image.address,
            label: "地址管理",
            onTap: () => Get.toNamed(CAppRoutes.mine + CAppRoutes.address,
                parameters: {"userId": "${user.id}"})),
        CMineTileEntity(icon: R.image.feedback, label: "意见反馈", onTap: () {}),
        CMineTileEntity(
            icon: R.image.customerService, label: "客服", onTap: () {})
      ];
}
