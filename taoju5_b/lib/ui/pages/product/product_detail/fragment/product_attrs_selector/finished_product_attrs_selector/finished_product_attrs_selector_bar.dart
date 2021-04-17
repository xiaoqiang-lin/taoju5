/*
 * @Description: 成品属性选择
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:20:50
 * @LastEditTime: 2020-12-23 09:21:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/finished_product_attrs_selector/finished_product_attrs_controller.dart';
import 'package:taoju5_b/domain/model/product/product_detail_model.dart';
import 'package:taoju5_bc/utils/common_kit.dart';

class FinishedProductAttrsSelectorBar extends StatelessWidget {
  final String tag;
  const FinishedProductAttrsSelectorBar({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinishedProductAttrsController>(
        tag: tag,
        builder: (_) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _.openFinishedProductAttrModal(context,
                product: _.product, id: tag, onConfirm: _.closeModal),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "选择",
                            style: TextStyle(
                                fontSize: BDimens.sp28,
                                color: BColors.greyTextColor),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            margin: EdgeInsets.only(left: BDimens.gap16),
                            child: Text(
                              "${_.product.tip}",
                              style: TextStyle(
                                  letterSpacing: .5,
                                  fontSize: BDimens.sp28,
                                  color: BColors.textColor),
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          BIcons.three_dot,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !CommonKit.isNullOrZero(_.product.colorCount),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: BDimens.gap16, left: BDimens.gap8),
                      child: Row(
                        children: [
                          Spacer(flex: 1),
                          Flexible(
                              flex: 4,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: BDimens.gap8,
                                      horizontal: BDimens.gap16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: BColors.scaffoldBgColor),
                                  child: Text(
                                    "共${_.product.colorCount}种颜色分类可选",
                                    style: TextStyle(
                                        fontSize: BDimens.sp26,
                                        color: BColors.greyTextColor),
                                  ))),
                          Spacer(flex: 4)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
