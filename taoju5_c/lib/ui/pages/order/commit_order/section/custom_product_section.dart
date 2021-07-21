/*
 * @Description:定制品区域
 * @Author: iamsmiling
 * @Date: 2021-05-14 17:39:30
 * @LastEditTime: 2021-07-20 18:11:31
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/section/pre_order_bill_sheet_section.dart';
import 'package:taoju5_c/ui/pages/order/widget/install_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/measure_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_measurement_need_switch_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:taoju5_c/ui/pages/order/widget/total_price_tip_bar.dart';

class CustomProductSection extends StatelessWidget {
  final List<ProductAdaptorEntity> products;
  final Function(String?)? onMeasureTimeChanged;
  final Function(String?)? onInstallTimeChanged;
  final ValueChanged<bool> onNeedMeasureChanged;
  final PreOrderInfoEntity order;
  final OrderType orderType;
  final bool needMeasure;
  const CustomProductSection(
      {Key? key,
      required this.products,
      this.onMeasureTimeChanged,
      this.onInstallTimeChanged,
      required this.onNeedMeasureChanged,
      required this.order,
      required this.orderType,
      this.needMeasure = true})
      : super(key: key);

  double get totalPrice {
    double t = 0;
    for (ProductAdaptorEntity p in products) {
      t += p.totalPrice;
    }
    return t;
  }

  bool get hasCustomProduct =>
      products.any((e) => e.productType is CustomProductType);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (ProductAdaptorEntity p in products)
          ProductAdaptorCard(
            product: p,
            rightTopCorner: Text(
              "¥${p.unitPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: R.dimen.sp13,
              ),
            ),
            footerBuilder: (BuildContext context) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: R.dimen.dp10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "商品总额",
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ff333333),
                        ),
                        Text(
                          "¥${p.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ffff5005),
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            },
          ),
        Visibility(
          visible: hasCustomProduct,
          child: OrderMeasurementNeedSwitchBar(
            onChanged: onNeedMeasureChanged,
            initialValue: needMeasure,
            key: ValueKey(needMeasure),
          ),
        ),
        Visibility(
            visible: hasCustomProduct && needMeasure,
            child: Column(
              children: [
                MeasureTimePickerBar(
                  onValueChanged: onMeasureTimeChanged,
                ),
                InstallTimePickerBar(
                  onValueChanged: onInstallTimeChanged,
                ),
              ],
            )),
        PreOrderBillSheetSection(
            bill: order.bill,
            orderType: OrderType.selectOrder,
            needMeasure: needMeasure),
        Visibility(
          visible: orderType == OrderType.selectOrder,
          child: TotalPriceTipBar(
            label: "定制商品小计：",
            totalPrice: totalPrice,
          ),
        )
      ],
    );
  }
}
