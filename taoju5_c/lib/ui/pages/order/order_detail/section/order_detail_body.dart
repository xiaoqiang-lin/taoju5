/*
 * @Description: 订单详情主体
 * @Author: iamsmiling
 * @Date: 2021-05-18 11:26:16
 * @LastEditTime: 2021-07-19 09:15:12
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_product_operation_mixin.dart';

import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:get/get.dart';

class ProductAdapterWithActionCard extends StatefulWidget {
  final OrderProductWrapperEntity wrapper;
  final OrderDetailEntity order;
  const ProductAdapterWithActionCard(
      {Key? key, required this.wrapper, required this.order})
      : super(key: key);

  @override
  _ProductAdapterWithActionCardState createState() =>
      _ProductAdapterWithActionCardState();
}

class _ProductAdapterWithActionCardState
    extends State<ProductAdapterWithActionCard>
    with OrderProductOperationMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: R.dimen.dp15),
      child: Column(
        children: [
          for (OrderProductEntity p in widget.wrapper.products)
            ProductAdaptorCard(
              product: p.product,
              rightTopCorner: Text(
                "¥${p.product.unitPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: R.dimen.sp12),
              ),
              headerBuilder: (BuildContext context) {
                return Visibility(
                  visible: p.product.productMeasureStatus != null,
                  child: ShakeAnimationWidget(
                    shakeAnimationController:
                        p.product.shakeAnimationController,
                    isForward: false,
                    shakeCount: 2,
                    shakeAnimationType: ShakeAnimationType.LeftRightShake,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: .5, color: R.color.ffe5e5e5))),
                      padding: EdgeInsets.only(
                          top: R.dimen.dp10, bottom: R.dimen.dp9),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            fontSize: R.dimen.sp14, color: R.color.ff181818),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${p.product.productMeasureStatus?.key}"),
                            GestureDetector(
                              onTap: () => Get.toNamed(Get.currentRoute +
                                  AppRoutes.measureData +
                                  "/${p.product.id}"),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: R.dimen.dp2),
                                    child: Text(
                                        "${p.product.productMeasureStatus?.value}"),
                                  ),
                                  Image.asset(R.image.next)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              footerBuilder: (BuildContext context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (OrderActionButtonEntity b
                        in p.product.actions.reversed)
                      PrimaryButton(
                        mode: b.mode,
                        text: b.text,
                        onPressed: () {
                          Function.apply(actionMap[b.actionCode] ?? (_, __) {},
                              [widget.order, p.product]);
                        },
                        margin: EdgeInsets.only(left: R.dimen.dp10),
                        textStyle: TextStyle(
                            fontSize: R.dimen.sp13,
                            fontWeight: FontWeight.normal),
                        constraints: BoxConstraints(
                            minWidth: R.dimen.dp84, minHeight: R.dimen.dp32),
                        padding: EdgeInsets.symmetric(
                            horizontal: R.dimen.dp16, vertical: R.dimen.dp7),
                      )
                  ],
                );
              },
            ),
          for (OrderBillEntity b in widget.wrapper.bills)
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
                          "${b.hint}",
                          style: TextStyle(
                              fontSize: R.dimen.sp11, color: R.color.ff999999),
                        )),
                    visible: b.hint.isNotEmpty,
                  ),
                  Spacer(),
                  Text(
                    "${b.amount.value}",
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
}

class OrderDetailBody extends StatelessWidget {
  final OrderDetailEntity order;
  const OrderDetailBody({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
      child: Column(
        children: [
          ProductAdapterWithActionCard(
              wrapper: order.wrapper.customProduct, order: order),
          ProductAdapterWithActionCard(
            wrapper: order.wrapper.finishedProduct,
            order: order,
          ),
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
                          "  ${o.amount.value}",
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
