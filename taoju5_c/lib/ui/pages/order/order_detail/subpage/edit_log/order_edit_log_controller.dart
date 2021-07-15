/*
 * @Description: 工程部编辑记录
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:51:52
 * @LastEditTime: 2021-07-07 17:58:51
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/order/order_edit_log_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';

class OrderEditLogController
    extends BaseFutureLoadStateController<List<OrderEditLogEntity>> {
  OrderRepository _repository = OrderRepository();
  List<OrderEditLogEntity> logs = [];

  @override
  Future<List<OrderEditLogEntity>> loadData({Map? params}) {
    _repository.editLog(
      
    );
    return Future.value(logs);
  }
}
