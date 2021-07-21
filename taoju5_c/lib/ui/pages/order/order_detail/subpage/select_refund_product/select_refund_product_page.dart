/*
 * @Description: 选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:41:16
 * @LastEditTime: 2021-07-19 16:55:23
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
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
            ProductAdaptorEntity o = _.products[i];
            return Container(
              padding: EdgeInsets.symmetric(vertical: R.dimen.dp20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: R.color.ffe5e5e5, width: .5))),
              margin: EdgeInsets.only(left: R.dimen.dp20, right: R.dimen.dp24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RoundCheckbox(
                          key: ValueKey(o.selected),
                          value: o.selected,
                          onChanged: (bool flag) => _.select(o, flag)),
                      Container(
                        margin: EdgeInsets.only(
                            left: R.dimen.dp15, right: R.dimen.dp6),
                        child: ChimeraImage(
                          o.image,
                          width: R.dimen.dp85,
                          height: R.dimen.dp85,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: R.dimen.dp6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              o.name,
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff333333,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "¥${o.totalPrice}",
                              style: TextStyle(fontSize: R.dimen.sp12),
                            )
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            color: R.color.ff999999, fontSize: R.dimen.sp12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(o.skuName), Text("x${o.count}")],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            );
          },
          itemCount: _.products.length,
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
              Obx(() {
                return RoundCheckbox(
                    key: ValueKey(_.isCheckedAll),
                    value: _.isCheckedAll,
                    onChanged: _.selectAll);
              }),
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
                            "/${_.orderId}" +
                            AppRoutes.refund,
                        arguments: RefundProductParamsEntity(
                            products: _.selectedProducts,
                            cancelOrderReason: _.arg.cancelOrderReason,
                            orderId: "${_.orderId}")),
                size: PrimaryButtonSize.middle,
              )
            ],
          ),
        ),
      );
    });
  }
}
