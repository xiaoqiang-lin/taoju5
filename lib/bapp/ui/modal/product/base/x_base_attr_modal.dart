/*
 * @Description:通用的样式
 * @Author: iamsmiling
 * @Date: 2021-01-18 11:25:27
 * @LastEditTime: 2021-01-19 14:11:50
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';

class XBaseAttrModal extends StatelessWidget {
  final String title;
  final WidgetBuilder builder;
  final double height;
  final Function onConfirm;
  final Function onClose;
  const XBaseAttrModal(
      {Key key,
      @required this.title,
      @required this.builder,
      @required this.height,
      @required this.onConfirm,
      this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XBaseModal(
      height: height,
      onClose: onClose,
      header: Container(
        width: Get.width,
        padding: EdgeInsets.all(
          BDimens.gap32,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
        ),
      ),
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Get.theme.primaryColor,
          body: Builder(
            builder: builder,
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(BDimens.gap32),
            width: Get.width,
            height: kBottomNavigationBarHeight,
            child: ElevatedButton(
              child: Text("确定"),
              onPressed: onConfirm,
            ),
          ),
        );
      },
    );
  }
}
