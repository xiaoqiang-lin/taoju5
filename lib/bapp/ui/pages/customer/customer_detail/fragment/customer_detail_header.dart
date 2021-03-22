/*
 * @Description: 客户详情头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 16:42:28
 * @LastEditTime: 2021-01-11 11:21:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/constants/x_gender.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailHeader extends StatelessWidget {
  const CustomerDetailHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerDetailController>(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
        child: Row(
          children: [
            CircleAvatar(
              foregroundColor: Get.theme.primaryColor,
              radius: 72.sp,
              child: Image.asset("assets/images/customer_avatar.png"),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: BDimens.gap24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: BDimens.gap32),
                        child: Text("${_.customer.name}"),
                      ),
                      Text(_.customer.type)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: BDimens.gap32),
                        child: Text(getGenderName(_.customer.gender)),
                      ),
                      Text(_.customer.age),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: BDimens.gap32),
                        child: Text(getGenderName(_.customer.gender)),
                      ),
                      Text(_.customer.concreteAddress),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      );
    });
  }
}
