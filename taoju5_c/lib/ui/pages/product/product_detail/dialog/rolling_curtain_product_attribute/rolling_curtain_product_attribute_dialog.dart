/*
 * @Description: 卷帘属性弹窗
 * @Author: iamsmiling
 * @Date: 2021-05-24 09:33:04
 * @LastEditTime: 2021-07-20 14:42:58
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/dialog/rolling_curtain_product_attribute/rolling_curtain_product_controller.dart';

Future openRollingCurtainProductAttributeDialog(BuildContext context,
    {required ProductDetailEntity product,
    required CurtainAttributeEntity attribute,
    WidgetBuilder? footerBuilder,
    Function()? addToCart,
    Function()? buy}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: RollingCurtainProductAttributeDialog(
            attribute: attribute,
            product: product,
            footerBuilder: footerBuilder,
          ),
        );
      });
}

class RollingCurtainProductAttributeDialog extends StatelessWidget {
  final CurtainAttributeEntity attribute;
  final ProductDetailEntity product;
  final WidgetBuilder? footerBuilder;
  const RollingCurtainProductAttributeDialog(
      {Key? key,
      required this.attribute,
      required this.product,
      this.footerBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RollingCurtainProductAttributeController>(
      init: RollingCurtainProductAttributeController(
          product: product, attribute: attribute),
      builder: (_) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.all(R.dimen.dp20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "请输入窗帘尺寸",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: R.color.ff1b1b1b,
                            fontSize: R.dimen.sp15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: R.dimen.dp8, bottom: R.dimen.dp14),
                      child: Text(
                        "不足1㎡按1㎡计算",
                        style: TextStyle(
                          color: R.color.ff666666,
                          fontSize: R.dimen.sp14,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${attribute.measureData.room.label}",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff333333)),
                        Text("${attribute.measureData.room.value}",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff333333))
                      ],
                    ),
                    Wrap(
                      runSpacing: -R.dimen.dp7,
                      spacing: R.dimen.dp10,
                      children: [
                        for (WindowRoomOptionEntity o
                            in attribute.measureData.room.options)
                          PrimaryButton(
                            text: o.name,
                            textStyle: TextStyle(fontSize: R.dimen.sp12),
                            onPressed: () => _.selectRoom(o),
                            padding:
                                EdgeInsets.symmetric(horizontal: R.dimen.dp12),
                            radius: R.dimen.sp4,
                            mode: o.selected
                                ? PrimaryButtonMode.elevatedButton
                                : PrimaryButtonMode.outlinedButton,
                          )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: R.dimen.dp18, bottom: R.dimen.dp15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: R.dimen.dp15),
                            alignment: Alignment.center,
                            child: Text("宽(CM)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: R.dimen.sp12,
                                    color: R.color.ff333333)),
                          ),
                          Expanded(
                            child: SizedTextField(
                              key: ValueKey("宽"),
                              padding: EdgeInsets.only(left: R.dimen.dp10),
                              textAlign: TextAlign.start,
                              initialValue: attribute.measureData.size.width
                                  ?.toStringAsFixed(2),
                              onChanged: _.setWidth,
                              shakeController: attribute
                                  .measureData.size.heightShakeController,
                              hintColor: attribute.measureData.size.heightError
                                  ? R.color.ffff5005
                                  : R.color.ffbcbcbc,
                              decoration: InputDecoration(hintText: "请输入宽"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: R.dimen.dp15),
                          alignment: Alignment.center,
                          child: Text("高(CM)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.ff333333)),
                        ),
                        Expanded(
                          child: SizedTextField(
                            key: ValueKey("高"),
                            padding: EdgeInsets.only(left: R.dimen.dp10),
                            textAlign: TextAlign.start,
                            initialValue: attribute.measureData.size.width
                                ?.toStringAsFixed(2),
                            onChanged: _.setHeight,
                            shakeController: attribute
                                .measureData.size.heightShakeController,
                            hintColor: attribute.measureData.size.heightError
                                ? R.color.ffff5005
                                : R.color.ffbcbcbc,
                            decoration: InputDecoration(
                              hintText: "请输入高",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: R.dimen.dp14, bottom: R.dimen.dp10),
                      child: Text.rich(TextSpan(
                          text: "预计：",
                          style: TextStyle(fontSize: R.dimen.sp12),
                          children: [
                            TextSpan(
                                text:
                                    "¥${_.priceDelegator.totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: R.dimen.sp15,
                                    color: R.color.ffff5005))
                          ])),
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
                                    margin:
                                        EdgeInsets.only(right: R.dimen.dp10),
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
            ),
            Positioned(
                right: R.dimen.dp12,
                top: R.dimen.dp12,
                child: GestureDetector(
                  onTap: Get.back,
                  child: Image.asset(
                    R.image.closeImage,
                    color: R.color.ff333333,
                    width: R.dimen.dp14,
                  ),
                ))
          ],
        );
      },
    );
  }
}
