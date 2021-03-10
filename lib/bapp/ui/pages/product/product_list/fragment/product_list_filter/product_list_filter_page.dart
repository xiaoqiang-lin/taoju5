/*
 * @Description: 商品过滤页面
 * @Author: iamsmiling
 * @Date: 2020-12-25 16:28:08
 * @LastEditTime: 2021-01-19 13:53:06
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_filter_tag_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';

class ProductListFilterPage extends StatelessWidget {
  const ProductListFilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .72,
      color: Theme.of(context).primaryColor,
      height: Get.height,
      child: Scaffold(
        body: GetBuilder<ProductListFilterController>(
            init: ProductListFilterController(),
            autoRemove: false,
            builder: (_) {
              return XLoadStateBuilder(
                  loadState: _.loadState,
                  builder: (BuildContext context) {
                    return Container(
                      color: BColors.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                      child: ListView.builder(
                        itemCount: _.tagList?.length ?? 0,
                        itemBuilder: (BuildContext context, int i) {
                          ProductFilterTagModel tag = _.tagList[i];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: BDimens.gap16),
                                child: Text(tag.title),
                              ),
                              GetBuilder<ProductListFilterController>(
                                id: tag.key,
                                builder: (_) {
                                  return Wrap(
                                    runSpacing: BDimens.gap16,
                                    spacing: BDimens.gap32,
                                    children: [
                                      for (ProductFilterTagOptionModel option
                                          in tag.options)
                                        XCheckButton(
                                            isChecked: option.isChecked,
                                            onPresss: () =>
                                                _.selectOption(tag, option),
                                            child: Text(option.name))
                                    ],
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ),
                    );
                  });
            }),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                          color: BColors.outlineBorderColor, width: .8)),
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero))),
                  onPressed: () {
                    final controller = Get.find<ProductListFilterController>();
                    controller.reset();
                  },
                  child: Text("重置"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero))),
                    onPressed: () {
                      final controller =
                          Get.find<ProductListFilterController>();
                      controller.confirm();
                    },
                    child: Text("确定")),
              )
            ],
          ),
        ),
        // Row(
        //   children: [
        //     OutlinedButton(
        //       onPressed: () {
        //         final controller = Get.find<ProductListFilterController>();
        //         controller.reset();
        //       },
        //       child: Text("重置"),
        //     ),
        //     OutlinedButton(
        //       onPressed: () {
        //         final controller = Get.find<ProductListFilterController>();
        //         controller.confirm();
        //       },
        //       child: Text("确定"),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
