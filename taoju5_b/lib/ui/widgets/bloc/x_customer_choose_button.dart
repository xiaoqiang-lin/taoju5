/*
 * @Description: 选择客户的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-29 13:12:01
 * @LastEditTime: 2021-01-28 09:55:02
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5_b/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class XCustomerChooseButton extends StatefulWidget {
  final bool enabled;
  final ChooseCustomerEventModel event;
  const XCustomerChooseButton({Key key, this.enabled = true, this.event})
      : super(key: key);

  @override
  _XCustomerChooseButtonState createState() => _XCustomerChooseButtonState();
}

class _XCustomerChooseButtonState extends State<XCustomerChooseButton> {
  bool enabled;
  @override
  void initState() {
    enabled = widget.enabled;

    if (Get.arguments != null && Get.arguments is SelectProductEvent) {
      enabled = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProviderController>(builder: (_) {
      return TextButton.icon(
          key: ValueKey(_?.name),

          ///传递一个bool参数 表示是否展示 “选择已有客户” 的按钮
          onPressed: enabled
              ? () =>
                  Get.toNamed(BAppRoutes.customerEdit, arguments: widget.event)
              : null,
          icon: Image.asset(
            "assets/images/" + "customer_badge.png",
            color: !enabled ? BColors.disabledColor : null,
          ),
          label: Center(
            child: Text(
              _?.abbrName,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: !enabled ? BColors.disabledColor : null,
                  fontSize: BDimens.sp24),
            ),
          ));
    });
  }
}
