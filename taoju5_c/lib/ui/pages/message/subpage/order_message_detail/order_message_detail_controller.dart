/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:12:21
 * @LastEditTime: 2021-05-19 16:33:46
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/message/order_message_entity.dart';

class OrderMessageDetailController
    extends BaseFutureLoadStateController<List<OrderMessageEntity>> {
  List<OrderMessageEntity> messages = [];
  @override
  Future<List<OrderMessageEntity>> loadData({Map? params}) {
    messages = [
      OrderMessageEntity.sample(),
      OrderMessageEntity.sample(),
      OrderMessageEntity.sample()
    ];
    return Future.value(messages);
  }
}
