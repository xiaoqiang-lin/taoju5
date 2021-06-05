/*
 * @Description: 成品弹窗
 * @Author: iamsmiling
 * @Date: 2021-04-25 14:33:44
 * @LastEditTime: 2021-05-29 17:40:10
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/component/step_counter/step_counter.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/product/component/product_spec_option_chip.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/finished_product_attribute_modal/finished_product_attribute_modal_controller.dart';

Future openFinishedProductAttributeModal(BuildContext context,
    {required ProductDetailEntity product,
    required WidgetBuilder footerBuilder}) {
  return showModalPopUp(context, builder: (BuildContext context) {
    return ModalWrapper(builder: (BuildContext context) {
      return GetBuilder<FinishedProductAttributeController>(
          init: FinishedProductAttributeController(product: product),
          builder: (_) {
            return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: R.dimen.dp24, bottom: R.dimen.dp16),
                            child: Row(
                              children: [
                                Image.network(
                                  "${product.currentSku?.picture.cover}",
                                  width: R.dimen.dp60,
                                  height: R.dimen.dp60,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: R.dimen.dp15,
                                      top: R.dimen.dp5,
                                      bottom: R.dimen.dp5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "¥${product.currentSku?.price.toStringAsFixed(2)}",
                                        style: TextStyle(
                                            color: R.color.ffff5005,
                                            fontWeight: FontWeight.bold,
                                            fontSize: R.dimen.sp18),
                                      ),
                                      Text(
                                        "已选规格: ${product.currentSku?.name}",
                                        style: TextStyle(
                                            color: R.color.ff999999,
                                            fontSize: R.dimen.sp12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        for (ProductSpecEntity spec in product.specs)
                          Container(
                            margin: EdgeInsets.only(top: R.dimen.dp18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(bottom: R.dimen.dp8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${spec.name}",
                                          style: R.style.h3,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: R.dimen.dp6),
                                            child: Text(
                                              "${spec.selected?.name}",
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp9,
                                                  color: R.color.ff999999),
                                            ))
                                      ],
                                    )),
                                Container(
                                  margin: EdgeInsets.only(bottom: R.dimen.dp10),
                                  child: Wrap(
                                    spacing: R.dimen.dp18,
                                    runSpacing: R.dimen.dp12,
                                    children: [
                                      for (ProductSpecOptionEntity option
                                          in spec.options)
                                        ProductSpecOptionChip(
                                          option: option,
                                          onPressed: () =>
                                              _.select(spec, option),
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: R.dimen.dp12),
                          child: Row(
                            children: [
                              Text(
                                "数量",
                                style: R.style.h3,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: R.dimen.dp6),
                                  child: Text(
                                    "库存${product.currentSku?.stock}${product.unit}",
                                    style: TextStyle(
                                        fontSize: R.dimen.sp9,
                                        color: R.color.ff999999),
                                  )),
                              Spacer(),
                              StepCounter(
                                initialValue: product.count,
                                maxValue: product.currentSku?.stock ?? 999,
                                onChanged: _.setCount,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Builder(
                  builder: footerBuilder,
                ));
          });
    });
  });
}
