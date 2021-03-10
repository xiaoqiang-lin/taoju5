/*
 * @Description:提交订单头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:03:08
 * @LastEditTime: 2021-01-23 13:25:56
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderHeader extends GetView<CommitOrderController> {
  const CommitOrderHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: BColors.primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: BDimens.gap32,
          ),
          child: Column(
            children: [
              GetBuilder<CommitOrderController>(
                  id: "customer",
                  builder: (_) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                          BAppRoutes.customerAddressEdit + "/${_.customer?.id}",
                          arguments: controller.customer),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 64.sp,
                              child: Text(
                                "收",
                                style: TextStyle(
                                    color: BColors.primaryColor,
                                    fontSize: BDimens.sp48),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: BDimens.gap24),
                                child: GetBuilder<CustomerProviderController>(
                                  id: "address",
                                  builder: (_) {
                                    return Column(
                                      children: [
                                        if (controller
                                                .customer?.address?.addressId ==
                                            null)
                                          Text(
                                            "请填写服务地址",
                                            style: TextStyle(
                                                fontSize: BDimens.sp32,
                                                fontWeight: FontWeight.w500),
                                          )
                                        else
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "收货人:",
                                                    style: TextStyle(
                                                        fontSize: BDimens.sp28,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      controller
                                                              .customer?.name ??
                                                          "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize:
                                                              BDimens.sp28,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: BDimens.gap16),
                                                    child: Text(
                                                      controller
                                                              .customer?.tel ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize:
                                                              BDimens.sp26,
                                                          color:
                                                              BColors.tipColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: BDimens.gap8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "服务地址:",
                                                      style: TextStyle(
                                                          fontSize:
                                                              BDimens.sp26,
                                                          color:
                                                              BColors.tipColor),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        controller.customer
                                                            ?.concreteAddress,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize:
                                                                BDimens.sp26,
                                                            color: BColors
                                                                .tipColor),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Icon(
                              BIcons.next,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Divider(),
              Container(
                padding: EdgeInsets.only(bottom: BDimens.gap24),
                margin: EdgeInsets.only(top: BDimens.gap32),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "售",
                        style: TextStyle(
                            fontSize: BDimens.sp48,
                            fontWeight: FontWeight.w500),
                      ),
                      height: 128.sp,
                      width: 128.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(64.sp)),
                          color: BColors.primaryColor,
                          border: Border.all(
                              color: BColors.foregroundColor, width: 1)),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: BDimens.gap24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "销售员:${controller.user.nickName}",
                                  style: TextStyle(
                                      fontSize: BDimens.sp28,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: BDimens.gap16),
                                  child: Text(
                                    "${controller.user.userTel}",
                                    style: TextStyle(
                                        fontSize: BDimens.sp26,
                                        color: BColors.tipColor),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: BDimens.gap8),
                              child: Text("门店信息:${controller.user.shopName}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: BDimens.sp26,
                                    color: BColors.tipColor,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: BColors.lightBlueColor,
          padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                child: Text(
                  "·",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: BColors.blueTextColor,
                      fontSize: 24),
                ),
              ),
              Text(
                "提交订单后请联系销售顾问",
                style: TextStyle(
                  color: BColors.blueTextColor,
                  fontSize: BDimens.sp24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
