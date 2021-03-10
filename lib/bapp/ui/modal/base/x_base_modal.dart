/*
 * @Description: 弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-14 15:14:19
 * @LastEditTime: 2021-01-26 15:09:45
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

class XBaseModal extends StatelessWidget {
  final WidgetBuilder builder;
  final Widget header;
  final Widget divider;
  final double height;
  final Function onClose;
  const XBaseModal(
      {Key key,
      @required this.builder,
      this.header = const SizedBox.shrink(),
      this.divider = const SizedBox.shrink(),
      this.height,
      this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Container(
        height: height ?? Get.height * .72,
        width: Get.width,
        color: BColors.primaryColor,
        child: Stack(
          children: [
            Column(
              children: [
                header,
                divider,
                Expanded(child: Builder(builder: builder))
              ],
            ),
            Positioned(
              child: IconButton(
                icon: Icon(BIcons.close),
                onPressed: () {
                  Function.apply(onClose, []);
                  Navigator();
                },
              ),
              top: 5,
              right: 5,
            )
          ],
        ),
      ),
    );
  }
}
