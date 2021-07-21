/*
 * @Description: 型材属性弹窗
 * @Author: iamsmiling
 * @Date: 2021-05-24 11:15:20
 * @LastEditTime: 2021-07-20 10:43:37
 */

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/step_counter/step_counter.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

Future openSectionalbarProductAttributeDialog(BuildContext context,
    {required ProductDetailEntity product,
    WidgetBuilder? footerBuilder,
    Function()? addToCart,
    Function()? buy}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: SectionalbarProductAttributeDialog(
            product: product,
            footerBuilder: footerBuilder,
            addToCart: addToCart,
            buy: buy,
          ),
        );
      });
}

class SectionalbarController extends GetxController {
  late ProductDetailEntity product;
  late AddToCartParamsEntity arg;
  late BaseProductPriceDelegator priceDelegator;

  SectionalbarController({required this.product}) {
    arg = AddToCartParamsEntity(product: product);
    priceDelegator = SectionalBarProductPriceDelegator(product);
  }

  void setLength(String val) {
    arg.setLength(val);
    product.specTip = "用料 ${val}cm";
    update();
  }

  void setCount(int count) {
    product.count = count;
    update();
  }
}

class SectionalbarProductAttributeDialog extends StatelessWidget {
  final ProductDetailEntity product;
  final WidgetBuilder? footerBuilder;
  final Function()? addToCart;
  final Function()? buy;
  const SectionalbarProductAttributeDialog({
    Key? key,
    required this.product,
    required this.footerBuilder,
    this.addToCart,
    this.buy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionalbarController>(
        init: SectionalbarController(product: product),
        builder: (_) {
          return Container(
            width: R.dimen.dp280,
            padding: EdgeInsets.all(R.dimen.dp20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: R.dimen.dp48),
                  alignment: Alignment.center,
                  child: Text(
                    "请输入型材长度",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: R.color.ff1b1b1b,
                        fontSize: R.dimen.sp15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: R.dimen.dp15),
                            alignment: Alignment.center,
                            child: Text("长度(CM):",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ff333333)),
                          ),
                          Expanded(
                            child: SizedTextField(
                              constraints: BoxConstraints(
                                  maxHeight: R.dimen.dp32,
                                  maxWidth: R.dimen.dp100),
                              padding: EdgeInsets.only(left: R.dimen.dp10),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "请输入长度",
                              ),
                              initialValue: _.arg.product.length?.toString(),
                              onChanged: _.setLength,
                              hintColor: _.arg.lengthError
                                  ? R.color.ffff5005
                                  : R.color.ffbcbcbc,
                              shakeController: _.arg.lengthController,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: R.dimen.dp16),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: R.dimen.dp15),
                              alignment: Alignment.center,
                              child: Text("型材数量:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: R.dimen.sp14,
                                      color: R.color.ff333333)),
                            ),
                            StepCounter(onChanged: _.setCount),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp14, bottom: R.dimen.dp10),
                        child: Text.rich(TextSpan(
                            text: "预计：",
                            style: TextStyle(fontSize: R.dimen.sp12),
                            children: [
                              TextSpan(
                                  text: "¥${_.priceDelegator.totalPrice}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp15,
                                      color: R.color.ffff5005))
                            ])),
                      ),
                    ],
                  ),
                ),
                Builder(
                    builder: footerBuilder ??
                        (BuildContext context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryButton(
                                text: "加入购物车",
                                onPressed: addToCart,
                                size: PrimaryButtonSize.middle,
                                mode: PrimaryButtonMode.outlinedButton,
                                margin: EdgeInsets.only(right: R.dimen.dp10),
                              ),
                              PrimaryButton(
                                text: "立即购买",
                                onPressed: buy,
                                size: PrimaryButtonSize.middle,
                              )
                            ],
                          );
                        })
              ],
            ),
          );
        });
  }
}
