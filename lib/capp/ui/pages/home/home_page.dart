/*
 * @Description: c端首页
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:12:27
 * @LastEditTime: 2021-02-10 22:39:00
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/routes/capp_routes.dart';

class CHomePage extends StatelessWidget {
  const CHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C端首页"),
      ),
      floatingActionButton: Visibility(
        visible: !bool.fromEnvironment('dart.vm.product'),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(CAppRoutes.debug),
          child: Text("调试"),
        ),
      ),
    );
  }
}
