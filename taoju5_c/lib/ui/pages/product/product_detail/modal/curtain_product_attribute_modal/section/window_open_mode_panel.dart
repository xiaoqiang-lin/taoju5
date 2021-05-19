/*
 * @Description: 窗户打开方式
 * @Author: iamsmiling
 * @Date: 2021-05-11 15:17:09
 * @LastEditTime: 2021-05-14 09:51:45
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_child_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/res/R.dart';

class WindowOpenModePanel extends StatelessWidget {
  final CurtainMeasureDataAttributeEntity measureData;
  final Function(WindowOpenModeOptionEntity) onOpenModeChanged;
  final Function(WindowOpenModeEntity, WindowOpenModeOptionEntity)
      onChildOpenModeChanged;
  final Function() onSizeChanged;
  const WindowOpenModePanel(
      {Key? key,
      required this.measureData,
      required this.onOpenModeChanged,
      required this.onChildOpenModeChanged,
      required this.onSizeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp7, left: R.dimen.dp20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: R.dimen.dp15),
                      child: Text(measureData.openMode.label,
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff333333)),
                    ),
                    for (WindowOpenModeOptionEntity option
                        in measureData.openOptions)
                      PrimaryButton(
                        text: option.name,
                        textStyle: TextStyle(fontSize: R.dimen.sp12),
                        onPressed: () => onOpenModeChanged(option),
                        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp12),
                        radius: R.dimen.sp4,
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        mode: option.selected
                            ? PrimaryButtonMode.elevatedButton
                            : PrimaryButtonMode.outlinedButton,
                      )
                  ],
                ),
                for (WindowChildOpenModeEntity item
                    in measureData.childOpenModes)
                  Column(
                    children: [
                      for (WindowOpenModeEntity child in item.options)
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: R.dimen.dp15),
                              child: Text(child.label,
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff333333)),
                            ),
                            for (WindowOpenModeOptionEntity option
                                in child.options)
                              PrimaryButton(
                                text: option.name,
                                textStyle: TextStyle(fontSize: R.dimen.sp12),
                                onPressed: () =>
                                    onChildOpenModeChanged(child, option),
                                padding: EdgeInsets.symmetric(
                                    horizontal: R.dimen.dp12),
                                radius: R.dimen.sp4,
                                margin: EdgeInsets.only(right: R.dimen.dp10),
                                mode: option.selected
                                    ? PrimaryButtonMode.elevatedButton
                                    : PrimaryButtonMode.outlinedButton,
                              )
                          ],
                        )
                    ],
                  ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: R.dimen.dp20),
            child: Column(
              children: [
                for (WindowChildOpenModeEntity item
                    in measureData.childOpenModes)
                  Column(
                    children: [
                      for (WindowOpenModeEntity child in item.options)
                        Container(
                          margin: EdgeInsets.only(top: R.dimen.dp14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: R.dimen.dp15),
                                alignment: Alignment.center,
                                child: Text(child.size!.label,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: R.dimen.sp12,
                                        color: R.color.ff333333)),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: R.dimen.dp10),
                                      child: SizedTextField(
                                        initialValue: child.size!.width
                                            ?.toStringAsFixed(0),
                                        onChanged: child.size!.setWidth,
                                        shakeController:
                                            child.size!.widthShakeController,
                                        hintColor: child.size!.widthError
                                            ? R.color.ffff5005
                                            : Color(0xFFBCBCBC),
                                        decoration: InputDecoration(
                                          hintText: "请输入宽",
                                        ),
                                      ),
                                    ),
                                    SizedTextField(
                                      initialValue: child.size!.height
                                          ?.toStringAsFixed(0),
                                      onChanged: child.size!.setHeight,
                                      shakeController:
                                          child.size!.heightShakeController,
                                      hintColor: child.size!.heightError
                                          ? R.color.ffff5005
                                          : Color(0xFFBCBCBC),
                                      decoration:
                                          InputDecoration(hintText: "请输入高"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(right: R.dimen.dp15, left: R.dimen.dp20),
                  alignment: Alignment.center,
                  child: Text(measureData.size.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ff333333)),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        child: SizedTextField(
                          initialValue:
                              measureData.size.width?.toStringAsFixed(0),
                          onChanged: (String val) {
                            measureData.size.setWidth(val);
                            onSizeChanged();
                          },
                          shakeController:
                              measureData.size.widthShakeController,
                          hintColor: measureData.size.heightError
                              ? R.color.ffff5005
                              : Color(0xFFBCBCBC),
                          decoration: InputDecoration(
                            hintText: "请输入宽",
                          ),
                        ),
                      ),
                      SizedTextField(
                        initialValue:
                            measureData.size.height?.toStringAsFixed(0),
                        shakeController: measureData.size.heightShakeController,
                        hintColor: measureData.size.heightError
                            ? R.color.ffff5005
                            : Color(0xFFBCBCBC),
                        onChanged: (String val) {
                          measureData.size.setHeight(val);
                          onSizeChanged();
                        },
                        decoration: InputDecoration(hintText: "请输入高"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(right: R.dimen.dp15, left: R.dimen.dp20),
                  alignment: Alignment.center,
                  child: Text(measureData.groundClearance.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ff333333)),
                ),
                Container(
                    child: SizedTextField(
                        initialValue: measureData.groundClearance.value
                            ?.toStringAsFixed(0),
                        onChanged: measureData.groundClearance.setValue,
                        decoration: InputDecoration(
                          hintText: "请输入距离",
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
