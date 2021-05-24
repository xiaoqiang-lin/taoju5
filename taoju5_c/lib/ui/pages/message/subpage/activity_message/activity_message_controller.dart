/*
 * @Description: 活动通知
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:48:54
 * @LastEditTime: 2021-05-19 16:55:27
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/message/activity_message.dart';

class ActivityMessageController
    extends BaseFutureLoadStateController<List<ActivityMessageEntity>> {
  List<ActivityMessageEntity> messages = [];
  @override
  Future<List<ActivityMessageEntity>> loadData({Map? params}) {
    messages = [ActivityMessageEntity.sample(), ActivityMessageEntity.sample()];
    return Future.value(messages);
  }
}
