/*
 * @Description: 选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:41:16
 * @LastEditTime: 2021-07-14 16:22:22
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/select_refund_product/select_refund_product_controller.dart';
import 'package:get/get.dart';

class SelectRefundProductPage extends StatelessWidget {
  const SelectRefundProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectRefundProductController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("选择退款商品"),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int i) {
            OrderProductEntity o = _.order.products[i];
            return Container(
              padding: EdgeInsets.symmetric(vertical: R.dimen.dp20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: R.color.ffe5e5e5, width: .5))),
              margin: EdgeInsets.only(left: R.dimen.dp20, right: R.dimen.dp24),
              child: Row(
                children: [
                  RoundCheckbox(
                      value: o.selected,
                      onChanged: (bool flag) => _.select(o, flag)),
                  Container(
                    margin:
                        EdgeInsets.only(left: R.dimen.dp15, right: R.dimen.dp6),
                    child: ChimeraImage(
                      o.product.image,
                      width: R.dimen.dp85,
                      height: R.dimen.dp85,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            o.product.name,
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                color: R.color.ff333333,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("¥${o.product.totalPrice}")
                        ],
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            color: R.color.ff999999, fontSize: R.dimen.sp12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(o.product.skuName),
                            Text("x${o.product.count}")
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            );
          },
          itemCount: _.order.products.length,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              top: R.dimen.dp8,
              bottom: R.dimen.dp7,
              left: R.dimen.dp20,
              right: R.dimen.dp20),
          decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, -1),
                color: Colors.black.withAlpha(18))
          ]),
          child: Row(
            children: [
              RoundCheckbox(value: false, onChanged: (_) {}),
              Container(
                margin: EdgeInsets.only(left: R.dimen.dp8),
                child: Text(
                  "全选",
                  style: TextStyle(
                      fontSize: R.dimen.sp14, color: R.color.ff333333),
                ),
              ),
              Spacer(),
              PrimaryButton(
                text: "确定(${_.selectedProducts.length})",
                onPressed: _.selectedProducts.length == 0
                    ? null
                    : () => Get.toNamed(
                        AppRoutes.orderDetail +
                            "/${_.order.id}" +
                            AppRoutes.refund,
                        arguments: RefundProductParamsEntity(
                            products: _.selectedProducts
                                .map((e) => e.product)
                                .toList(),
                            order: _.order)),
                size: PrimaryButtonSize.middle,
              )
            ],
          ),
        ),
      );
    });
  }
}
