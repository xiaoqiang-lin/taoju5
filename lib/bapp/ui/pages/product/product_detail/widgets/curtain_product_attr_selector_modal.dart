/*
 * @Description:  窗帘商品属性选择器通用样式
 * @Author: iamsmiling
 * @Date: 2020-12-24 14:14:46
 * @LastEditTime: 2020-12-25 09:10:18
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

class CurtainProductAttrSelectorModal extends StatelessWidget {
  final String title;
  final double height;
  final TextStyle cancelTextStyle;
  final TextStyle confirmTextStyle;
  final WidgetBuilder builder;
  final Function onConfirm;
  const CurtainProductAttrSelectorModal(
      {Key key,
      this.title = "",
      this.height,
      this.cancelTextStyle,
      this.confirmTextStyle,
      this.builder,
      this.onConfirm})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        child: Stack(
          children: [
            Container(
              height: height ?? MediaQuery.of(context).size.height * .48,
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    child: Text(title),
                  ),
                  Expanded(
                      child: Builder(
                    builder: builder,
                  )),

                  ElevatedButton(
                      onPressed: () {
                        if (onConfirm != null) onConfirm();
                        Navigator.of(context).pop();
                      },
                      child: Text("确认")),
                  // XSubmitButton(
                  //     text: "确认",
                  //     callback: () {
                  //       if (onConfirm != null) {
                  //         onConfirm();
                  //       }
                  //       Navigator.of(context).pop(data);
                  //     })
                ],
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  BIcons.close,
                  color: const Color(0xFF333333),
                ),
              ),
              top: 10,
              right: 10,
            )
          ],
        ));
  }
}
