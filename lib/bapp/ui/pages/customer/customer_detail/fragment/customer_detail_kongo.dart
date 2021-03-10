/*
 * @Description: 客户详情金刚区
 * @Author: iamsmiling
 * @Date: 2021-01-07 16:51:24
 * @LastEditTime: 2021-01-12 21:50:53
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailKongo extends StatelessWidget {
  const CustomerDetailKongo({Key key}) : super(key: key);

  get id => Get.find<CustomerDetailController>().customer.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: BDimens.gap32, vertical: BDimens.gap48),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F000000),
              spreadRadius: 1.0,
              blurRadius: 1,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [],
      ),
    );
  }
}
