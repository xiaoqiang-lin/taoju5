/*
 * @Description: 订单商品清单卡片
 * @Author: iamsmiling
 * @Date: 2021-06-02 16:19:45
 * @LastEditTime: 2021-06-02 16:24:20
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/order/order_mainfest_entity.dart';
import 'package:taoju5_c/res/R.dart';

class OrderMainfestCard extends StatelessWidget {
  final OrderProductMainfestEntity mainfest;
  const OrderMainfestCard({Key? key, required this.mainfest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: R.dimen.dp10, left: R.dimen.dp24, right: R.dimen.dp24),
      child: Column(
        children: [
          for (List<OrderProductMainfestItemEntity> o in mainfest.items)
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        for (OrderProductMainfestItemEntity e in o)
                          Container(
                            margin: EdgeInsets.only(top: R.dimen.dp12),
                            child: Row(
                              children: [
                                ChimeraImage(
                                  e.image,
                                  width: R.dimen.dp50,
                                  height: R.dimen.dp50,
                                ),
                                Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: R.dimen.dp10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e.label}",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp14,
                                                color: R.color.ff333333,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: R.dimen.dp5),
                                            child: Text(
                                              "${e.amount}",
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp12,
                                                  color: R.color.ff999999),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${e.price}",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff333333),
                                      ),
                                      Text(
                                        "${e.description}",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff999999),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: o != mainfest.items.last,
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                        child: Divider(
                          height: .5,
                        )),
                  )
                ],
              ),
            ),
          for (OrderProductMainfestSheetItemEntity sheet in mainfest.sheets)
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${sheet.label}",
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: R.color.ff333333,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${sheet.value.value}",
                    style: TextStyle(
                        fontSize: R.dimen.sp12,
                        color: sheet.value.highlighted
                            ? R.color.ffff5005
                            : R.color.ff333333),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
