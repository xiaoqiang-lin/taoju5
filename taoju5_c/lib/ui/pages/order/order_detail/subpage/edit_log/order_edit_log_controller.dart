/*
 * @Description: 工程部编辑记录
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:51:52
 * @LastEditTime: 2021-05-20 17:06:45
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/order/order_edit_log_entity.dart';

class OrderEditLogController
    extends BaseFutureLoadStateController<List<OrderEditLogEntity>> {
  List<OrderEditLogEntity> logs = [];

  @override
  Future<List<OrderEditLogEntity>> loadData({Map? params}) {
    logs = List.generate(4, (index) => OrderEditLogEntity.fromJson({}));
    return Future.value(logs);
  }
}
