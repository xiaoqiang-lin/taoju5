/*
 * @Description:取消订单
 * @Author: iamsmiling
 * @Date: 2021-05-20 15:07:27
 * @LastEditTime: 2021-07-12 11:05:17
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/checkbox/round_checked_box.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

Future openCancelOrderModal<int>(
    BuildContext context, CancelOrderReasonEntity reason,
    {String title = "取消订单"}) {
  String currentOption = reason.options.first;
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
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
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: R.dimen.sp15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                          child: Text(
                            "请选择取消订单原因",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff999999),
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
                                      key: ValueKey(o),
                                      value: o == currentOption,
                                      onChanged: (_) {
                                        print(o);
                                        setState(() {
                                          currentOption = o;
                                        });
                                      })
                                ],
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: kBottomNavigationBarHeight,
                  decoration:
                      BoxDecoration(color: R.color.ffffffff, boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(0, -1),
                        color: Colors.black.withAlpha(18))
                  ]),
                  padding: EdgeInsets.only(
                      bottom: Get.mediaQuery.padding.bottom + R.dimen.dp7,
                      left: R.dimen.dp20,
                      right: R.dimen.dp20,
                      top: R.dimen.dp8),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(false),
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
                              "暂不取消",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ffee9b5f),
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(currentOption),
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
                              "确定取消",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ffffffff),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      });
}
