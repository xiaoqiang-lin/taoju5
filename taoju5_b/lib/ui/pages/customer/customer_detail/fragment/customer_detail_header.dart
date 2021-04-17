/*
 * @Description: 客户详情头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 16:42:28
 * @LastEditTime: 2021-01-11 11:21:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/constants/x_gender.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/customer/customer_detail/customer_detail_controller.dart';

class CustomerDetailHeader extends StatelessWidget {
  const CustomerDetailHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerDetailController>(builder: (_) {
      return Container(
        // padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: BDimens.gap32),
              child: Image.asset(
                "assets/images/customer_avatar.png",
                fit: BoxFit.fitWidth,
                width: 80,
                // width: 120,
              ),
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
                        child: Text(
                          "${_.customer.name}",
                          style: TextStyle(
                              fontSize: BDimens.sp36,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        _.customer.type,
                        style: TextStyle(
                            color: BColors.greyTextColor,
                            fontSize: BDimens.sp24,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                    child: Row(
                      children: [
                        Visibility(
                          visible: _.customer.gender != XGender.unknown,
                          child: Padding(
                            padding: EdgeInsets.only(right: BDimens.gap32),
                            child: Text(getGenderName(_.customer.gender)),
                          ),
                        ),
                        Text("${_.customer.age}岁"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(right: BDimens.gap32),
                      //   child: Icon(
                      //     BIcons.add,
                      //     size: 16,
                      //   ),
                      // ),
                      Text(
                        _.customer.concreteAddress,
                        style: TextStyle(
                            fontSize: BDimens.sp26,
                            color: BColors.greyTextColor),
                      ),
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
