/*
 * @Description:取消订单
 * @Author: iamsmiling
 * @Date: 2021-05-20 15:07:27
 * @LastEditTime: 2021-05-20 16:35:13
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/checkbox/round_checked_box.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

Future openCancelOrderModal<int>(
    BuildContext context, CancelOrderReasonEntity reason) {
  return showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(R.dimen.sp7),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: R.dimen.dp16, bottom: R.dimen.dp8),
                      width: R.dimen.width,
                      child: Text(
                        "取消订单",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: R.dimen.sp15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                        child: Text(
                          "请选择取消订单原因",
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff999999),
                        )),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        for (String o in reason.options)
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: R.dimen.dp14),
                            child: Row(
                              children: [
                                Text(
                                  o,
                                  style: TextStyle(fontSize: R.dimen.sp12),
                                ),
                                Spacer(),
                                RoundCheckbox(
                                    key: ObjectKey(o),
                                    value: reason.options.indexOf(o) == 0,
                                    onChanged: (_) {})
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(),
                  Container(
                    height: kBottomNavigationBarHeight,
                    margin: EdgeInsets.only(
                        bottom: Get.mediaQuery.padding.bottom,
                        left: R.dimen.dp20,
                        right: R.dimen.dp20,
                        top: R.dimen.dp8),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: R.dimen.sp12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: R.color.ffee9b5f),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(R.dimen.sp30),
                                  bottomLeft: Radius.circular(R.dimen.sp30),
                                )),
                            child: Text(
                              "确定取消",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ffee9b5f),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: R.color.ffee9b5f,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(R.dimen.sp30),
                                  bottomRight: Radius.circular(R.dimen.sp30),
                                )),
                            padding:
                                EdgeInsets.symmetric(vertical: R.dimen.sp12),
                            alignment: Alignment.center,
                            child: Text(
                              "暂不取消",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ffffffff),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
