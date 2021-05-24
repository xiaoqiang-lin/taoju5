/*
 * @Description: 消息
 * @Author: iamsmiling
 * @Date: 2021-05-19 15:44:03
 * @LastEditTime: 2021-05-19 15:58:09
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/message/message_entity.dart';

class MessageController
    extends BaseFutureLoadStateController<List<MessageEntity>> {
  List<MessageEntity> messages = [];

  @override
  Future<List<MessageEntity>> loadData({Map? params}) {
    messages = [
      MessageEntity(
          title: "订单进度通知", subtitle: "您的订单进度有更新，快去看看吧", count: 8, type: 1),
      MessageEntity(title: "活动通知", subtitle: "暂时没有新的活动通知哦~", count: 0, type: 2)
    ];
    return Future.value(messages);
  }
}
