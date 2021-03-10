/*
 * @Description: 成品弹窗看了,2.
 * 3.69++326
 * @Author: iamsmiling
 * @Date: 2021-01-15 22:59:59
 * @LastEditTime: 2021-01-19 13:52:28
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/finished_product_attrs_selector/finished_product_attrs_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_step_counter.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_submit_button.dart';

Future showFinishedProductAttrModal(BuildContext context,
    {ProductDetailModel product, int id}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(builder: (BuildContext context) {
          return GetBuilder<FinishedProductAttrsController>(
              init: FinishedProductAttrsController(product: product, id: id),
              builder: (_) {
                return XLoadStateBuilder(
                    loadState: _.loadState,
                    builder: (BuildContext context) {
                      return Scaffold(
                        body: Container(
                          margin: EdgeInsets.all(BDimens.gap32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: BDimens.gap24),
                                      width: 180.w,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: CachedNetworkImage(
                                            imageUrl: _.product.cover),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "¥${_.product.price.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: BDimens.sp36,
                                              fontWeight: FontWeight.w500,
                                              color: BColors.highLightColor),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: BDimens.gap20),
                                          child: Text(
                                            ("${_.product.currentSpecOptionName ?? ""}"),
                                            style: TextStyle(
                                                fontSize: BDimens.sp28,
                                                color: BColors
                                                    .descriptionTextColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: BDimens.gap24),
                                  child: Divider()),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: BDimens.gap24),
                                child: Text(
                                  "数量:",
                                  style: TextStyle(
                                      fontSize: BDimens.sp28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              XStepCounter(
                                  onChanged: null,
                                  onSubstract: null,
                                  onPlus: null),
                              for (ProductSpecModel spec in _.product.specList)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: BDimens.gap24),
                                      child: Text(
                                        "${spec.name}:",
                                        style: TextStyle(
                                            fontSize: BDimens.sp28,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        for (ProductSpecOptionModel option
                                            in spec.optionList)
                                          XCheckButton(
                                              isChecked: option.isChecked,
                                              onPresss: () => _.select(option),
                                              child: Text("${option.name}"))
                                      ],
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                        bottomNavigationBar: XSubmitButton(
                            child: Text("确定"),
                            onFuture: () => Future.value(false)),
                      );
                    });
              });
        });
      });
}
