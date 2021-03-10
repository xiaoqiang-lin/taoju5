/*
 * @Description: 修改型材长度
 * @Author: iamsmiling
 * @Date: 2021-01-15 21:00:11
 * @LastEditTime: 2021-01-17 22:50:59
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/sectionalbar_product_adapter_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_sized_text_field.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showModifySectionalBarLengthModal(BuildContext context,
    {@required SectionalProductAdapterModel product}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(BDimens.gap32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 180.w,
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: XPhotoViewer(url: product.image)))
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
                    child: Text(
                      "米数:",
                      style: TextStyle(
                          fontSize: BDimens.sp28, fontWeight: FontWeight.w500),
                    ),
                  ),
                  XSizedTextField(
                    width: 272.w,
                    hintText: "输入米数: 例1.5",
                  )
                ],
              ),
            );
          },
        );
      });
}
