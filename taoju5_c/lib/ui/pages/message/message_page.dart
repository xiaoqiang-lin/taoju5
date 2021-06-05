/*
 * @Description: 消息中心
 * @Author: iamsmiling
 * @Date: 2021-05-19 15:41:40
 * @LastEditTime: 2021-06-04 18:05:22
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/message/message_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/message/message_controller.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息中心"),
      ),
      body: FutureLoadStateBuilder<MessageController>(
        controller: controller,
        builder: (MessageController _) {
          return ListView.builder(
              itemCount: _.messages.length,
              itemBuilder: (BuildContext context, int i) {
                MessageEntity item = _.messages[i];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Get.toNamed(AppRoutes.prefix + item.path),
                  child: Container(
                    margin: EdgeInsets.only(top: R.dimen.dp10),
                    padding: EdgeInsets.symmetric(
                        horizontal: R.dimen.dp20, vertical: R.dimen.dp8),
                    child: Row(
                      children: [
                        Image.asset(item.icon),
                        Container(
                          margin: EdgeInsets.only(left: R.dimen.dp10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: R.dimen.dp10),
                                  child: Text(
                                    item.subtitle,
                                    style: TextStyle(
                                        fontSize: R.dimen.sp12,
                                        color: R.color.ff999999),
                                  )),
                            ],
                          ),
                        ),
                        Spacer(),
                        Visibility(
                          visible: item.count > 1,
                          child: Container(
                            margin: EdgeInsets.only(right: R.dimen.dp20),
                            alignment: Alignment.center,
                            width: R.dimen.dp18,
                            height: R.dimen.dp18,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(R.dimen.dp18 / 2),
                              color: R.color.ffff5005,
                            ),
                            child: Text(
                              "${item.count}",
                              style: TextStyle(
                                  fontSize: R.dimen.sp8,
                                  color: R.color.ffffffff),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
