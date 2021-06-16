/*
 * @Description: 订单详情主体
 * @Author: iamsmiling
 * @Date: 2021-05-18 11:26:16
 * @LastEditTime: 2021-06-11 16:22:07
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:get/get.dart';

class OrderDetailBody extends StatelessWidget {
  final OrderDetailEntity order;
  const OrderDetailBody({Key? key, required this.order}) : super(key: key);

  Widget _buildProductSection(OrderProductWrapperEntity wrapper) {
    return Container(
      padding: EdgeInsets.only(bottom: R.dimen.dp15),
      child: Column(
        children: [
          for (OrderProductEntity p in wrapper.products)
            ProductAdaptorCard(
              product: p.product,
              rightTopCorner: Text(
                "¥${p.product.unitPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: R.dimen.sp12),
              ),
              headerBuilder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: .5, color: R.color.ffe5e5e5))),
                  padding:
                      EdgeInsets.only(top: R.dimen.dp15, bottom: R.dimen.dp9),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff181818),
                    child: Row(
                      children: [
                        Text("请确认测装数据"),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: R.dimen.dp2),
                          child: Text("修改"),
                        ),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                );
              },
              footerBuilder: (BuildContext context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (OrderActionButtonEntity b in p.product.actions)
                      PrimaryButton(
                          size: PrimaryButtonSize.middle,
                          mode: b.mode,
                          text: b.text,
                          onPressed: () {})
                  ],
                );
              },
            ),
          for (OrderBillEntity b in wrapper.bills)
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp15),
              child: Row(
                children: [
                  Text(
                    b.label,
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff181818),
                  ),
                  Visibility(
                    child: Container(
                        margin: EdgeInsets.only(left: R.dimen.dp5),
                        child: Text(
                          "(${b.hint})",
                          style: TextStyle(
                              fontSize: R.dimen.sp11, color: R.color.ff999999),
                        )),
                    visible: b.hint.isNotEmpty,
                  ),
                  Spacer(),
                  Text(
                    "¥${b.amount.value}",
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: b.amount.highlighted
                            ? R.color.ffff5005
                            : R.color.ff333333),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
      child: Column(
        children: [
          _buildProductSection(order.wrapper.customProduct),
          _buildProductSection(order.wrapper.finishedProduct),
          Divider(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (OrderBillEntity o in order.wrapper.bills)
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${o.label}:",
                          style: TextStyle(
                              fontSize: R.dimen.sp14,
                              color: R.color.ff181818,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "  ¥${o.amount.value}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14,
                              fontWeight: o.amount.bold
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: o.amount.highlighted
                                  ? R.color.ffff5005
                                  : R.color.ff333333),
                        )
                      ],
                    ),
                  ),
                GestureDetector(
                  onTap: () =>
                      Get.toNamed(Get.currentRoute + AppRoutes.mainfest),
                  child: Container(
                    // width: R.dimen.width,
                    // alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(vertical: R.dimen.dp15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          order.wrapper.tip,
                          style: TextStyle(
                              color: R.color.ff666666, fontSize: R.dimen.sp14),
                        ),
                        Image.asset(
                          R.image.next,
                          color: R.color.ff666666,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
