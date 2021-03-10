/*
 * @Description: 填写测装数据
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:20:33
 * @LastEditTime: 2021-02-01 17:09:42
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_card.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';

class EditMeasureDataPage extends StatelessWidget {
  const EditMeasureDataPage({Key key}) : super(key: key);

  String get tag => Get.parameters["id"];

  void confirm() {
    Get.find<WindowStyleSelectorController>(tag: tag).confirm();
    Get.find<SizeSelectorController>(tag: tag).confirm();

    ///更新总价
    Get.find<ProductDetailController>(tag: tag).updateTotalPrice();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BColors.primaryColor,
        appBar: AppBar(
          title: Text("测装数据"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: GetBuilder<WindowStyleSelectorController>(
                  tag: tag,
                  builder: (_) {
                    return Image.asset(
                      "assets/images/" + _.mainImg,
                      height: 480.w,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: Column(
                  children: [
                    RoomAttrSelectorBar(tag: tag),
                    PatternSelectorBar(tag: tag),
                    WindowStyleSelectorBar(tag: tag),
                    SizeSelectorCard(tag: tag)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          margin: EdgeInsets.all(BDimens.gap32),
          child: ElevatedButton(
            child: Text("确认"),
            onPressed: confirm,
          ),
        ));
  }
}
