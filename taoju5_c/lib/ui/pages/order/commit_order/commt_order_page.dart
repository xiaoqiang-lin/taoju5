/*
 * @Description: 提交订单ui
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:16:33
 * @LastEditTime: 2021-04-28 11:18:10
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:get/get.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下测量单"),
      ),
    );
  }
}
