/*
 * @Description: 退款页面
 * @Author: iamsmiling
 * @Date: 2021-07-09 13:59:12
 * @LastEditTime: 2021-07-12 15:15:13
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/button/upload_image_button.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/refund_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/widget/refund_product_card.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/widget/refund_rule_tip.dart';

class RefundPage extends GetView<RefundController> {
  const RefundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.ffffffff,
      appBar: AppBar(
        title: Text("申请退款"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: R.dimen.dp20),
                color: R.color.ffffffff,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: R.dimen.dp24,
                          top: R.dimen.dp13,
                          bottom: R.dimen.dp12),
                      child: Text(
                        "退款商品",
                        style: TextStyle(
                            fontSize: R.dimen.sp14,
                            color: R.color.ff181818,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: R.dimen.dp24),
                      height: R.dimen.dp85,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        children: [
                          for (ProductAdaptorEntity p in controller.products)
                            RefundProductCard(product: p)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: R.dimen.dp10,
                thickness: R.dimen.dp10,
                color: R.color.fff5f5f5,
              ),
              Container(
                color: R.color.ffffffff,
                padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: R.dimen.dp18 + R.dimen.dp1,
                            bottom: R.dimen.dp18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "退款商品",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff181818,
                                  fontWeight: FontWeight.w600),
                            ),
                            GetBuilder<RefundController>(builder: (_) {
                              return GestureDetector(
                                onTap: _.openCancelOrderModal,
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: R.dimen.dp4),
                                      child: Text(
                                        _.description,
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff999999),
                                      ),
                                    ),
                                    Image.asset(R.image.next)
                                  ],
                                ),
                              );
                            })
                          ],
                        )),
                    Divider(),
                    Container(
                        padding: EdgeInsets.only(
                            top: R.dimen.dp18 + R.dimen.dp1,
                            bottom: R.dimen.dp18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "退款金额",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff181818,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "¥${controller.totalPrice}",
                              style: TextStyle(
                                  fontSize: R.dimen.sp13,
                                  color: R.color.ffee9b5f,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Divider(
                height: R.dimen.dp10,
                thickness: R.dimen.dp10,
                color: R.color.fff5f5f5,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: R.dimen.dp24, top: R.dimen.dp14, right: R.dimen.dp24),
                color: R.color.ffffffff,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "补充描述",
                      style: TextStyle(
                          fontSize: R.dimen.sp14,
                          color: R.color.ff181818,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(R.dimen.sp7),
                          color: R.color.fff5f5f5),
                      margin: EdgeInsets.only(top: R.dimen.dp13),
                      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            maxLength: 200,
                            style: TextStyle(fontSize: R.dimen.sp12),
                            buildCounter: (
                              BuildContext context, {
                              required int currentLength,
                              required int? maxLength,
                              required bool isFocused,
                            }) {
                              return Text(
                                '$currentLength/$maxLength字',
                                semanticsLabel: 'character count',
                                style: TextStyle(
                                    fontSize: R.dimen.sp10,
                                    color: R.color.ff999999),
                              );
                            },
                            decoration: InputDecoration(
                                hintText: "请描述您在使用商品中遇到的具体原因",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: R.dimen.dp24, right: R.dimen.dp24),
                            child: UploadImageButton(
                              width: R.dimen.dp56,
                              height: R.dimen.dp56,
                              color: R.color.transparent,
                              formData: controller.arg.formData,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RefundRuleTip()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
          BoxShadow(
              spreadRadius: .1,
              offset: Offset(0, -1),
              color: Colors.black.withOpacity(.08))
        ]),
        // height: kBottomNavigationBarHeight,
        padding: EdgeInsets.only(
            top: R.dimen.dp7,
            // bottom: Get.mediaQuery.padding.bottom,
            left: R.dimen.dp20,
            right: R.dimen.dp20),
        child: PrimaryButton(
          text: "提交",
          onPressed: () {},
          margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom + R.dimen.dp8,
          ),
          padding: EdgeInsets.symmetric(vertical: R.dimen.dp13),
        ),
      ),
    );
  }
}
