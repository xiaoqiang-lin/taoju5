/*
 * @Description:实体类
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-19 14:23:36
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class MineKongoEntity {
  final String label;
  final String icon;
  final Function()? onTap;
  final int count;
  MineKongoEntity(
      {required this.label,
      this.count = 0,
      required this.icon,
      required this.onTap});
}

class MineTileEntity {
  final String label;
  final String icon;
  final Function()? onTap;

  MineTileEntity(
      {required this.label, required this.icon, required this.onTap});
}

class MineController extends GetxController {
  UserEntity user = UserEntity.smaple();

  List<MineKongoEntity> get kongos => [
        MineKongoEntity(icon: R.image.toBeMeasured, label: "待测量", onTap: () {}),
        MineKongoEntity(
            icon: R.image.toBeSelected, label: "待选品", count: 12, onTap: () {}),
        MineKongoEntity(icon: R.image.toBePaid, label: "待付款", onTap: () {}),
        MineKongoEntity(
            icon: R.image.toBeDelivered, label: "待发货", onTap: () {}),
        MineKongoEntity(
            icon: R.image.toBeInstalled, label: "待安装", onTap: () {}),
      ];

  List<MineTileEntity> get tiles => [
        MineTileEntity(icon: R.image.star, label: "我的收藏", onTap: () {}),
        MineTileEntity(icon: R.image.footprint, label: "我的足迹", onTap: () {}),
        MineTileEntity(
            icon: R.image.address,
            label: "地址管理",
            onTap: () => Get.toNamed(
                  AppRoutes.mine + AppRoutes.addressList,
                )),
        MineTileEntity(
            icon: R.image.feedback,
            label: "意见反馈",
            onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.feedback)),
        MineTileEntity(
            icon: R.image.customerService, label: "客服", onTap: () {}),
        MineTileEntity(
            icon: R.image.customerService, label: "售后申请", onTap: () {})
      ];

  @override
  void onInit() {
    MineRepository _repository = MineRepository();
    _repository.getUserInfo().then((UserEntity value) {
      user = value;
      update();
    });
    super.onInit();
  }
}
