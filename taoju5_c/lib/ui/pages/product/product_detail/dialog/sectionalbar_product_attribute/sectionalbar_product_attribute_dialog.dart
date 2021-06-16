/*
 * @Description: 型材属性弹窗
 * @Author: iamsmiling
 * @Date: 2021-05-24 11:15:20
 * @LastEditTime: 2021-06-04 07:11:38
 */

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/step_counter/step_counter.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

Future openSectionalbarProductAttributeDialog(BuildContext context,
    {required ProductDetailEntity product,
    required ProductAttributeEntity attribute,
    WidgetBuilder? footerBuilder}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SectionalbarProductAttributeDialog(
              attribute: attribute,
              product: product,
              footerBuilder: footerBuilder),
        );
      });
}

class SectionalbarController extends GetxController {
  late ProductDetailEntity product;
  late AddToCartParamsEntity arg;
  late ProductAttributeEntity attribute;
  SectionalbarController({required this.product, required this.attribute}) {
    arg = AddToCartParamsEntity(product: product);
  }

  Future addToCart() {
    CartRepository cartRepository = CartRepository();
    try {
      arg.validate();
      attribute.finished = true;
      return cartRepository.addToCart(params: arg.params).then((value) {
        // Get.back();
      });
    } catch (err) {
      attribute.finished = false;
      print(err);
    } finally {
      FocusManager.instance.primaryFocus?.unfocus();
      update();
    }
    throw ArgumentError.value(arg);
  }

  Future? buy() {
    try {
      arg.validate();
      attribute.finished = true;
      product.attributeDesc = "用料:${product.length}cm";
      return Get.toNamed(AppRoutes.commitOrder, arguments: [product.adapt([])]);
    } catch (err) {
      attribute.finished = false;
      print(err);
    } finally {
      update();
    }
    throw ArgumentError.value(arg);
  }

  hasFinished() {
    print(product.length);
    attribute.finished = !CommonKit.isNullOrZero(product.length);
    if (attribute.finished) {
      product.specTip = "用料：${product.length} 数量：${product.count}";
    }
  }
}

class SectionalbarProductAttributeDialog extends StatelessWidget {
  final ProductDetailEntity product;
  final WidgetBuilder? footerBuilder;
  final ProductAttributeEntity attribute;
  const SectionalbarProductAttributeDialog(
      {Key? key,
      required this.product,
      required this.footerBuilder,
      required this.attribute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionalbarController>(
        init: SectionalbarController(product: product, attribute: attribute),
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              _.hasFinished();
              return true;
            },
            child: Container(
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
                                onChanged: _.arg.setLength,
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
                              StepCounter(onChanged: (int value) {
                                product.count = value;
                              }),
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
                                    text: "¥1999.00",
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
                                  onPressed: _.addToCart,
                                  size: PrimaryButtonSize.middle,
                                  mode: PrimaryButtonMode.outlinedButton,
                                  margin: EdgeInsets.only(right: R.dimen.dp10),
                                ),
                                PrimaryButton(
                                  text: "立即购买",
                                  onPressed: _.buy,
                                  size: PrimaryButtonSize.middle,
                                )
                              ],
                            );
                          })
                ],
              ),
            ),
          );
        });
  }
}
