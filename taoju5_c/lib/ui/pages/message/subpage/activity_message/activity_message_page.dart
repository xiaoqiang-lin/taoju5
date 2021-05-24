/*
 * @Description: 活动消息
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:47:47
 * @LastEditTime: 2021-05-19 17:05:03
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/message/activity_message.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/message/subpage/activity_message/activity_message_controller.dart';

class ActivityMessagePage extends GetView<ActivityMessageController> {
  const ActivityMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("活动通知"),
      ),
      body: FutureLoadStateBuilder<ActivityMessageController>(
        controller: controller,
        builder: (ActivityMessageController _) {
          return ListView.builder(
              itemCount: _.messages.length,
              itemBuilder: (BuildContext context, int i) {
                ActivityMessageEntity item = _.messages[i];
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: R.dimen.dp20, vertical: R.dimen.dp10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(item.cover),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: R.dimen.dp15),
                          margin: EdgeInsets.symmetric(vertical: R.dimen.dp10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ff333333,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.date,
                                    style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ffb4b4b4,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: R.dimen.dp3),
                                    child: Text(
                                      "查看详情",
                                      style: TextStyle(
                                        fontSize: R.dimen.sp12,
                                        color: R.color.ffb4b4b4,
                                      ),
                                    ),
                                  ),
                                  Image.asset(R.image.next)
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
