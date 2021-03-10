import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMeasureDataEditPage extends StatelessWidget {
  const OrderMeasureDataEditPage({Key key}) : super(key: key);

  OrderMeasureDataController get controller =>
      Get.find<OrderMeasureDataController>();

  String get tag => controller.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        appBar: AppBar(
          title: Text("打开方式"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
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
                WindowStyleSelectorBar(tag: tag),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          margin: EdgeInsets.all(BDimens.gap32),
          child: ElevatedButton(
            child: Text(
              "确认",
            ),
            onPressed: controller.saveOpenMode,
          ),
        ));
  }
}
