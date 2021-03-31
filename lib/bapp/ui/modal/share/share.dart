/*
 * @Description: 分享弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:27:15
 * @LastEditTime: 2021-02-19 14:18:12
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/share/taojuwu_share_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/share/product/share_product_controller.dart';

Future showShareModal(BuildContext context, int productId) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(
            height: 450.h,
            builder: (BuildContext context) {
              return GetBuilder<ShareProductController>(
                  init: ShareProductController(productId),
                  builder: (_) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: BDimens.gap32,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: BDimens.gap32,
                                ),
                                child: Text(
                                  "分享至",
                                  style: TextStyle(
                                      fontSize: BDimens.sp30,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Divider(),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: BDimens.gap32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    for (XShareModel e in _.list)
                                      GestureDetector(
                                        onTap: e.onTap,
                                        behavior: HitTestBehavior.opaque,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                                "assets/images/" + e.icon),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: BDimens.gap16),
                                              child: Text(
                                                e.description,
                                                style: TextStyle(
                                                    fontSize: BDimens.sp22,
                                                    color: BColors
                                                        .descriptionTextColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: BDimens.gap16,
                          thickness: BDimens.gap16,
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "取消",
                              style: TextStyle(
                                  fontSize: BDimens.sp30,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    );
                  });
            });
      });
}
