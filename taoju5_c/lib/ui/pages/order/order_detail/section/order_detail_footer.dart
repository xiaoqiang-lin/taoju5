/*
 * @Description: 订单详情底部
 * @Author: iamsmiling
 * @Date: 2021-05-18 14:38:11
 * @LastEditTime: 2021-05-18 15:16:53
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/copy_button.dart';
import 'package:taoju5_c/component/carousel/carousel_slide.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class OrderDetailFooter extends StatelessWidget {
  final OrderDetailEntity order;
  const OrderDetailFooter({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: R.dimen.dp15, horizontal: R.dimen.dp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.manuscript.title,
                style:
                    TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
              ),
              Visibility(
                  visible: order.manuscript.pictures.isNotEmpty,
                  child: Container(
                    padding: EdgeInsets.only(top: R.dimen.dp10),
                    child: CarouselSlide(
                      itemCount: order.manuscript.pictures.length,
                      viewportFraction: 1,
                      itemHeight:
                          (R.dimen.width - R.dimen.dp24 * 2) * 155 / 327,
                      itemWidth: R.dimen.width - R.dimen.dp24 * 2,
                      itemBuilder: (BuildContext context, int i) {
                        return ChimeraImage(
                            imageUrl: order.manuscript.pictures[i].cover);
                      },
                      containerHeight:
                          (R.dimen.width - R.dimen.dp24 * 2) * 155 / 327,
                    ),
                  )),
            ],
          ),
        ),
        Divider(
            thickness: R.dimen.dp10,
            color: R.color.fff5f5f5,
            height: R.dimen.dp10),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: R.dimen.dp15, horizontal: R.dimen.dp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.sheet.title,
                style:
                    TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
              ),
              for (OrderSheetItemEntity item in order.sheet.items)
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: Row(
                    children: [
                      Text(
                        item.key,
                        style: TextStyle(
                            fontSize: R.dimen.sp12, color: R.color.ff666666),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: R.dimen.dp40, right: R.dimen.dp30),
                          child: Text(
                            item.value,
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff666666),
                          )),
                      Visibility(
                          visible: item.canCopy,
                          child: CopyButton(content: item.value))
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
