/*
 * @Description:实体类
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-08-05 13:44:45
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

import 'dialog/customer_service_dialog.dart';

class MineTileEntity {
  final String label;
  final String icon;
  final Function()? onTap;

  MineTileEntity(
      {required this.label, required this.icon, required this.onTap});
}

class MineController extends BaseFutureLoadStateController {
  UserEntity user = UserEntity.smaple();

  List<OrderTabEntity> kongos = [];

  List<MineTileEntity> get tiles => [
        MineTileEntity(
            icon: R.image.star,
            label: "我的收藏",
            onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.collection)),
        MineTileEntity(
            icon: R.image.footprint,
            label: "我的足迹",
            onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.footPrint)),
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
            icon: R.image.customerService,
            label: "客服",
            onTap: () => openCustomerServiceDialog(Get.context!)),
        // MineTileEntity(
        //     icon: R.image.customerService, label: "售后申请", onTap: () {}),
        // MineTileEntity(
        //     icon: R.image.address,
        //     label: "查看物流",
        //     onTap: () => Get.toNamed(AppRoutes.logistics)),
      ];

  @override
  Future loadData({Map? params}) {
    return Future.wait(
            [MineRepository().getUserInfo(), OrderRepository().orderTabList()])
        .then((List list) {
      user = list.first;
      kongos = list.last;
    }).whenComplete(update);
  }

  void editProfie() {
    Get.toNamed(AppRoutes.mine + AppRoutes.setting, arguments: user)
        ?.then((value) {
      user = value;
      update();
    });
  }
}
