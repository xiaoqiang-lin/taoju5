/*
 * @Description: 订单提交成功
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:09:33
 * @LastEditTime: 2021-07-17 17:07:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';

class CommitOrderSuccessController extends ChimeraRefreshController {
  String id = Get.parameters["order_id"] ?? "";
  @override
  void onInit() {
    super.onInit();

    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "order");
  }

  @override
  Future loadData({Map? params}) {
    return Future.value();
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "order").loadMore();
  }
}
