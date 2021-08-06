/*
 * @Description: 门店详情
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:55:55
 * @LastEditTime: 2021-07-23 17:33:07
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/store/store_detail_entity.dart';
import 'package:taoju5_c/domain/repository/store_repository.dart';

class StoreDetailController extends BaseFutureLoadStateController {
  String id = Get.parameters["id"] ?? "";
  bool like = false;
  late StoreDetailEntity store;
  @override
  Future loadData({Map? params}) {
    StoreRepository repository = StoreRepository();
    return repository.storeDetail(params: {"shop_id": id}).then((value) {
      store = value;
      like = store.isCollected;
    });
  }
}
