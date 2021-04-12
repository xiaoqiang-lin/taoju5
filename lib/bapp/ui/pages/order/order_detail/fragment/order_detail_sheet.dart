/*
 * @Description: 修改价格相关
 * @Author: iamsmiling
 * @Date: 2021-01-13 15:48:35
 * @LastEditTime: 2021-01-15 09:10:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/fragment/base_sheet/finished_product_order_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/fragment/base_sheet/measure_order_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

import 'base_sheet/selection_order_sheet.dart';

class OrderDetailSheet extends GetView<OrderDetailController> {
  const OrderDetailSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
      child: Column(
        children: [
          if (controller.order.orderType == OrderType.endProductOrder)
            FinishedProductOrderSheet()
          else if (controller.order.orderType == OrderType.measureOrder)
            MeasureOrderSheet()
          else
            SelectionOrderSheet(),
          // DefaultTextStyle(
          //   style:
          //       TextStyle(color: BColors.textColor, fontSize: BDimens.sp28),
          //   child: Column(
          //     children: [
          //       Container(
          //         padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               "定金:",
          //             ),
          //             Text(
          //               "¥${controller.order.deposit}",
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
          //         child: GetBuilder<OrderDetailController>(
          //           id: "modifyPrice",
          //           builder: (_) {
          //             return Visibility(
          //                 visible: (controller.order.orderStatus ==
          //                         OrderStatus.toBePaid &&
          //                     controller.order.isPriceModified),
          //                 child: Column(
          //                   children: [
          //                     Container(
          //                       padding: EdgeInsets.symmetric(
          //                           vertical: BDimens.gap4),
          //                       child: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text("原价:",
          //                               style: TextStyle(
          //                                 fontSize: BDimens.sp28,
          //                               )),
          //                           Text(
          //                             "¥${controller.order.originalPrice}",
          //                             style: TextStyle(
          //                                 fontWeight: FontWeight.w500),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Visibility(
          //                       visible: _.order.orderStatus ==
          //                           OrderStatus.toBePaid,
          //                       child: Container(
          //                         padding: EdgeInsets.symmetric(
          //                             vertical: BDimens.gap4),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text("修改:"),
          //                             Spacer(),
          //                             Text(
          //                               "¥${controller.order.deltaPrice}",
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.w500),
          //                             ),
          //                             Visibility(
          //                               child: Text(
          //                                 "(${controller.order.modifyPriceNote})",
          //                                 style: TextStyle(
          //                                     fontWeight: FontWeight.w500),
          //                               ),
          //                               visible: !GetUtils.isNullOrBlank(
          //                                   controller.order.modifyPriceNote),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ));
          //           },
          //         ),
          //       ),
          //       Visibility(
          //         visible:
          //             controller.order.orderStatus == OrderStatus.toBePaid,
          //         child: GestureDetector(
          //           child: Container(
          //             padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text("合计:"),
          //                 GetBuilder<OrderDetailController>(
          //                     id: "modifyPrice",
          //                     builder: (_) {
          //                       return Text(
          //                         "¥${controller.order.balance}",
          //                         style:
          //                             TextStyle(fontWeight: FontWeight.w500),
          //                       );
          //                     })
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Container(
          //           padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                   "${controller.order.orderStatus < OrderStatus.toBePaid ? '预计总价' : '合计'}:"),
          //               Text(
          //                 "¥${controller.order.originalPrice}",
          //                 style: TextStyle(
          //                     color: BColors.pinkColor,
          //                     fontSize: BDimens.sp36,
          //                     fontWeight: FontWeight.w500),
          //               )
          //             ],
          //           )),
          //       if (controller.order.orderStatus == OrderStatus.toBePaid)
          //         GestureDetector(
          //           onTap: controller.openModifyPriceModal,
          //           child: Container(
          //             padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text("尾款:"),
          //                 GetBuilder<OrderDetailController>(
          //                     id: "modifyPrice",
          //                     builder: (_) {
          //                       return Text(
          //                         "¥${controller.order.balance}",
          //                         // style:
          //                         //     TextStyle(fontWeight: FontWeight.w500),
          // style: TextStyle(
          //     color: BColors.pinkColor,
          //     fontSize: BDimens.sp36,
          //     fontWeight: FontWeight.w500),
          //                       );
          //                     })
          //               ],
          //             ),
          //           ),
          //         ),
          GestureDetector(
            onTap: () => Get.toNamed(
                BAppRoutes.orderMainfest + "/${controller.order.id}"),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "共${controller.order?.productList?.length ?? 1}件,",
                    style: TextStyle(
                        fontSize: BDimens.sp26, color: BColors.tipColor),
                  ),
                  Text(
                    "查看商品清单",
                    style: TextStyle(fontSize: BDimens.sp26),
                  ),
                  Icon(BIcons.next)
                ],
              ),
            ),
          ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
