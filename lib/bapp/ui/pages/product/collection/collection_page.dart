/*
 * @Description: 收藏页面
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:40:53
 * @LastEditTime: 2021-01-07 17:44:55
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collection_controller.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏夹"),
      ),
      body: GetBuilder<CollectionController>(
        builder: (_) {
          return Text(_.toString());
        },
      ),
    );
  }
}
