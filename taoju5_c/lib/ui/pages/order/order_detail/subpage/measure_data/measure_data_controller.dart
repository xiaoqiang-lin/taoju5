/*
 * @Description: 测装
 * @Author: iamsmiling
 * @Date: 2021-06-28 16:35:43
 * @LastEditTime: 2021-07-05 14:16:20
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';

import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';

class MeasureDataController
    extends BaseFutureLoadStateController<CurtainMeasureDataAttributeEntity> {
  OrderRepository _repository = OrderRepository();

  late CurtainMeasureDataAttributeEntity measureData;

  @override
  Future<CurtainMeasureDataAttributeEntity> loadData({Map? params}) {
    String? id = Get.parameters["order_goods_id"] ?? Get.parameters["id"];

    return _repository
        .measureData(params: {"order_goods_id": id}).then((value) {
      measureData = value;
      return value;
    });
  }

  Future submit() {
    // return Future.value();
    Map map = measureData.params;
    map.addAll({"order_goods_id": Get.parameters["id"]});
    return _repository.updateMeasureData(params: map).then((value) {
      Get.back(result: true);
    });
  }
}
