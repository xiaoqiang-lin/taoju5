/*
 * @Description: 用户协议
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:32:00
 * @LastEditTime: 2021-01-09 20:50:10
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/user_protocol/user_protocol_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:taoju5/bapp/ui/pages/user_protocol/user_protocol_skeleton.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';

class UserProtocolPage extends StatelessWidget {
  const UserProtocolPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProtocolController>(
      builder: (_) {
        return XLoadStateBuilder(
          loadState: _.loadState,
          retry: _.loadData,
          loadingWidget: UserProtocolSkeleton(),
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Get.theme.primaryColor,
              appBar: AppBar(
                title: Text("${_.protocol.title}"),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.8),
                  child: // 模糊进度条(会执行一个动画)
                      Container(),
                ),
              ),
              body: SingleChildScrollView(
                child: Html(
                  data: _.protocol.content,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
