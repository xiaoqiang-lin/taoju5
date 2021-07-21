/*
 * @Description: 售后底部
 * @Author: iamsmiling
 * @Date: 2021-05-24 15:29:12
 * @LastEditTime: 2021-07-12 15:12:19
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/upload_image_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/aftersell_controller.dart';

class AfterSellFooter extends StatelessWidget {
  final AftersellController controller;
  const AfterSellFooter({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: R.dimen.dp13,
          left: R.dimen.dp24,
          right: R.dimen.dp24,
          bottom: R.dimen.dp18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp12),
            child: Text(
              "补充描述",
              style: TextStyle(
                  fontSize: R.dimen.sp14,
                  color: R.color.ff181818,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: R.dimen.width,
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(R.dimen.sp7),
                color: R.color.fff5f5f5),
            child: Column(
              children: [
                TextFormField(
                  maxLength: 200,
                  maxLines: 3,
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
                          fontSize: R.dimen.sp10, color: R.color.ff999999),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "请描述您在使用商品中遇到的具体原因",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                Container(
                  width: R.dimen.width,
                  padding:
                      EdgeInsets.only(bottom: R.dimen.dp10, top: R.dimen.dp3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(R.dimen.sp7),
                      color: R.color.fff5f5f5),
                  child: Wrap(
                    spacing: R.dimen.dp7,
                    runSpacing: R.dimen.dp7,
                    children: [
                      for (Widget item in controller.images)
                        Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 7, right: 7),
                                child: item),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                    // onTap: () => _.delete(item),
                                    child: Image.asset(R.image.delete)))
                          ],
                        ),
                      Container(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp7, right: R.dimen.dp7),
                        child: UploadImageButton(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
