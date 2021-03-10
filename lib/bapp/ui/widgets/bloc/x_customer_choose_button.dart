/*
 * @Description: 选择客户的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-29 13:12:01
 * @LastEditTime: 2021-01-28 09:55:02
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';

class XCustomerChooseButton extends StatelessWidget {
  final bool enabled;
  const XCustomerChooseButton({Key key, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProviderController>(builder: (_) {
      return TextButton.icon(
          key: ValueKey(_?.name),

          ///传递一个bool参数 表示是否展示 “选择已有客户” 的按钮
          onPressed: enabled
              ? () => Get.toNamed(BAppRoutes.customerEdit + "/1")
              : null,
          icon: Image.asset("assets/images/" + "customer_badge.png"),
          label: Text(
            _?.abbrName,
            maxLines: 1,
          ));
    });
  }
}
