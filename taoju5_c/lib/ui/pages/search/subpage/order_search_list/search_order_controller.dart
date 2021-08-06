/*
 * @Description: 订单搜索结果页面
 * @Author: iamsmiling
 * @Date: 2021-07-28 14:54:42
 * @LastEditTime: 2021-07-28 16:01:43
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';

class SearchOrderController extends ChimeraRefreshController {
  String keyword = Get.parameters["keyword"] ?? "";

  List<OrderEntity> get orders =>
      Get.find<OrderListController>(tag: "-1").orders;

  void search() {
    Get.toNamed(AppRoutes.searchInput,
            parameters: {"keyword": keyword}, preventDuplicates: true)
        ?.then((value) {
      print(value);
      if (value is String && value.isNotEmpty && keyword != value) {
        keyword = value;
        update();
        if (Get.isRegistered<OrderListController>(tag: "-1")) {
          OrderListController c = Get.find<OrderListController>(tag: "-1");
          c.keyword = keyword;
          c.refreshData();
        }
      }
    });
  }

  @override
  void onInit() {
    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "searchOrderList-$keyword");
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete<SearchOrderController>(force: true);
    Get.delete<CommendationController>(
        tag: "searchOrderList-$keyword", force: true);
    super.onClose();
  }

  @override
  Future loadData({Map? params}) {
    return Get.find<CommendationController>(tag: "searchOrderList-$keyword")
        .loadData();
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "searchOrderList-$keyword")
        .loadMore();
  }
}
