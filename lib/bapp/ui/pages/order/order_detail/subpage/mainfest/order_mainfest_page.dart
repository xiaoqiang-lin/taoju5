import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_mainfest_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_copy_button.dart';

class OrderMainfestPage extends StatelessWidget {
  const OrderMainfestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("商品清单"),
      ),
      body: GetBuilder<OrderMainfestController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              retry: _.loadData,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.all(BDimens.gap16),
                    margin: EdgeInsets.symmetric(
                        horizontal: BDimens.gap20, vertical: BDimens.gap20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          margin: EdgeInsets.only(bottom: BDimens.gap24),
                          padding: EdgeInsets.symmetric(
                              vertical: BDimens.gap16,
                              horizontal: BDimens.gap24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: BDimens.gap8),
                                child: Text(
                                  "客户:${_.mainfest.clientName}",
                                  style: TextStyle(
                                      fontSize: BDimens.sp30,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "订单编号:${_.mainfest.orderNo}",
                                    style: TextStyle(
                                        fontSize: BDimens.sp26,
                                        color: BColors.descriptionTextColor),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: BDimens.gap24),
                                      child: XCopyButton(
                                          content: _.mainfest.orderNo))
                                ],
                              )
                            ],
                          ),
                        ),
                        for (ProductMainfestModel product
                            in _.mainfest.productList)
                          Container(
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                vertical: BDimens.gap16,
                                horizontal: BDimens.gap24),
                            margin: EdgeInsets.only(bottom: BDimens.gap24),
                            child: Column(
                              children: [
                                for (ClothMaterialModel item
                                    in product.clothList)
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: BDimens.gap48),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${item.productName}"),
                                            Text("¥${item.price}")
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: BDimens.gap8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${item.productPrice}",
                                                style: TextStyle(
                                                    fontSize: BDimens.sp26,
                                                    color: BColors
                                                        .descriptionTextColor),
                                              ),
                                              Text(
                                                "${item.key}:${item.value}",
                                                style: TextStyle(
                                                    fontSize: BDimens.sp26,
                                                    color: BColors
                                                        .descriptionTextColor),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: BDimens.gap20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "共${_.mainfest.totalCount}件,小计:",
                                        style:
                                            TextStyle(fontSize: BDimens.sp28),
                                      ),
                                      Text(
                                        "¥${_.mainfest.totalPrice}",
                                        style: TextStyle(
                                            fontSize: BDimens.sp36,
                                            fontWeight: FontWeight.w600),
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
                );
              });
        },
      ),
    );
  }
}
