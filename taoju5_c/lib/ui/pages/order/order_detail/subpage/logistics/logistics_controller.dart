/*
 * @Description: 物流控制器
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:30:22
 * @LastEditTime: 2021-06-18 10:54:22
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class LogisticsController
    extends BaseFutureLoadStateController<List<PackageEntity>> {
  List<PackageEntity> packets = [
    PackageEntity.fromJson({}),
    PackageEntity.fromJson({}),
    PackageEntity.fromJson({}),
    PackageEntity.fromJson({}),
    PackageEntity.fromJson({})
  ];

  List<BuildContext> contexts = [];
  @override
  Future<List<PackageEntity>> loadData({Map? params}) {
    OrderRepository repository = OrderRepository();
    return repository.logistics(params: {"order_id": 1700}).then((value) {
      packets = value;
      return value;
    });
  }

  dial(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastKit.error("无法打开链接");
      throw "Could not launch $url";
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
