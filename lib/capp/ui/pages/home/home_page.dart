/*
 * @Description: c端首页
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:12:27
 * @LastEditTime: 2021-02-10 22:39:00
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/component/button/like_button.dart';
import 'package:taoju5/capp/component/indicator/carousel_indicator.dart';

import 'package:taoju5/capp/routes/capp_routes.dart';

import 'home_controller.dart';

class CHomePage extends StatelessWidget {
  const CHomePage({Key key}) : super(key: key);

  static MethodChannel methodChannel = MethodChannel('taoju5_amap');

  // _goToMapView() async {
  //   return methodChannel.invokeMethod("goToMapView");
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CHomeController>(
        init: CHomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("C端首页"),
            ),
            body: DefaultTabController(
                length: _.tabs.length,
                child: Column(
                  children: [
                    TabBar(tabs: [
                      for (String item in _.tabs)
                        Tab(
                          child: Text(item),
                        )
                    ]),
                    Expanded(
                        child: TabBarView(children: [
                      for (String item in _.tabs)
                        Column(
                          children: [
                            Text(item),
                            Row(
                              children: [
                                OutlinedButton(
                                    onPressed: () {}, child: Text("取消订单")),
                                OutlinedButton(
                                    onPressed: () {}, child: Text("去选品")),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {}, child: Text("取消订单")),
                                ElevatedButton(
                                    onPressed: null, child: Text("去选品")),
                              ],
                            ),
                            CupertinoSwitch(value: true, onChanged: (_) {}),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => (Container(
                                          height: 100,
                                          child: Material(child: Text("测试")),
                                        )));
                              },
                              child: Text("取消"),
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: "请输入用户名"),
                            ),
                            CarouselIndicator(),
                            LikeAnimationWidget(),
                            ButtonBar(
                              children: [],
                            ),
                            ToggleButtons(children: [], isSelected: []),
                            Checkbox(value: false, onChanged: (_) {}),
                            Checkbox(
                                tristate: true, value: true, onChanged: (_) {})
                          ],
                        ),
                    ]))
                  ],
                )),
            floatingActionButton: Visibility(
              visible: !bool.fromEnvironment('dart.vm.product'),
              child: FloatingActionButton(
                onPressed: () => Get.toNamed(CAppRoutes.amap),
                child: Text("调试"),
              ),
            ),
          );
        });
  }
}
