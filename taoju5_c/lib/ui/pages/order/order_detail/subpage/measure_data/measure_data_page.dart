/*
 * @Description: 测装数据
 * @Author: iamsmiling
 * @Date: 2021-06-28 16:35:08
 * @LastEditTime: 2021-07-05 13:51:20
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_child_open_mode_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_open_mode_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_controller.dart';

class MeasureDataPage extends GetView<MeasureDataController> {
  const MeasureDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测装数据"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset(R.image.customerService))
        ],
      ),
      body: FutureLoadStateBuilder<MeasureDataController>(
          controller: controller,
          builder: (_) {
            return ScrollConfiguration(
              behavior: NoRippleScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MeasureDataBody(measureData: _.measureData),
                    MeasureDataSheet(measureData: _.measureData)
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              left: R.dimen.dp20,
              bottom: Get.mediaQuery.padding.bottom,
              top: R.dimen.dp7,
              right: R.dimen.dp20),
          decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, -1),
                color: Colors.black.withAlpha(18))
          ]),
          child: PrimaryButton(
              size: PrimaryButtonSize.large,
              text: "确认",
              onPressed: controller.submit)),
    );
  }
}

class MeasureDataSheet extends StatelessWidget {
  final CurtainMeasureDataAttributeEntity measureData;
  const MeasureDataSheet({Key? key, required this.measureData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: R.dimen.sp13, color: R.color.ff333333),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp13),
              child: DefaultTextStyle(
                style:
                    TextStyle(fontSize: R.dimen.sp13, color: R.color.ff999999),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("型材类型："),
                    Text("${measureData.sectionalBar}")
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp13),
              child: Row(
                children: [
                  Text("型材型号："),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: R.dimen.dp8),
                    child: Text(
                      "${measureData.sectionalBarType}",
                      style: TextStyle(color: R.color.ffee9b5f),
                    ),
                  ),
                  Image.asset(
                    R.image.next,
                    color: R.color.ffee9b5f,
                  )
                ],
              ),
            ),
            Divider(),
            Container(
                margin:
                    EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("测装备注："),
                    Expanded(
                        child: Text(
                      "${measureData.note}",
                      textAlign: TextAlign.end,
                    ))
                  ],
                )),
            Divider(),
            Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp13),
                child: Text("图片：")),
            Container(
              margin: EdgeInsets.only(bottom: R.dimen.dp30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "若对测装数据有疑问，请",
                    style: TextStyle(
                      color: R.color.ff999999,
                      fontSize: R.dimen.sp13,
                    ),
                  ),
                  Text(
                    "联系客服",
                    style: TextStyle(
                        color: R.color.ffff5005, fontSize: R.dimen.sp13),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MeasureDataBody extends StatelessWidget {
  final CurtainMeasureDataAttributeEntity measureData;
  const MeasureDataBody({Key? key, required this.measureData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: DefaultTextStyle(
              style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("空间"),
                          Text(
                            "${measureData.room.value}",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff999999),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("窗型"),
                          Text(
                            "${measureData.facade.value}",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff999999),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: R.dimen.dp7,
                          left: R.dimen.dp45,
                          right: R.dimen.dp45),
                      child:
                          Image.asset("assets/images/${measureData.mainImage}"),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: R.dimen.dp15),
                          padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                          child: Text("安装方式"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: R.dimen.dp85,
                          height: R.dimen.dp32,
                          decoration: BoxDecoration(
                              color: R.color.fff5f5f5,
                              borderRadius: BorderRadius.circular(R.dimen.sp4)),
                          child: Text(
                            "${measureData.installMode.selectedOption?.name}",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff999999),
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      visible: measureData.openModeId == 3,
                      child: StatefulBuilder(builder: (context, setState) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: R.dimen.dp15),
                                  padding: EdgeInsets.symmetric(
                                      vertical: R.dimen.dp14),
                                  child: Text("打开方式"),
                                ),
                                PrimaryButton(
                                  mode: PrimaryButtonMode.materialButton,
                                  radius: R.dimen.sp4,
                                  constraints: BoxConstraints(
                                      minHeight: R.dimen.dp32,
                                      minWidth: R.dimen.dp85),
                                  text: "分墙体打开",
                                  textStyle: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff999999),
                                  margin: EdgeInsets.only(right: R.dimen.dp10),
                                )
                              ],
                            ),
                            for (WindowChildOpenModeEntity child
                                in measureData.childOpenModes)
                              for (WindowOpenModeEntity o in child.options)
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                right: R.dimen.dp15),
                                            padding: EdgeInsets.symmetric(
                                                vertical: R.dimen.dp14),
                                            child: Text(o.label)),
                                        for (WindowOpenModeOptionEntity i
                                            in o.options)
                                          PrimaryButton(
                                              mode: i.selected
                                                  ? PrimaryButtonMode
                                                      .elevatedButton
                                                  : PrimaryButtonMode
                                                      .outlinedButton,
                                              radius: R.dimen.sp4,
                                              constraints: BoxConstraints(
                                                  minHeight: R.dimen.dp32,
                                                  minWidth: R.dimen.dp85),
                                              text: i.name,
                                              textStyle: TextStyle(
                                                  fontSize: R.dimen.sp12),
                                              margin: EdgeInsets.only(
                                                  right: R.dimen.dp10),
                                              onPressed: () {
                                                setState(() {
                                                  o.options.forEach((e) {
                                                    e.selected = e == i;
                                                  });
                                                });
                                              }),
                                      ],
                                    )
                                  ],
                                )
                          ],
                        );
                      }),
                    ),
                    Visibility(
                      visible: measureData.openModeId != 3,
                      child: StatefulBuilder(
                          builder: (context, StateSetter setState) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: R.dimen.dp15),
                              padding:
                                  EdgeInsets.symmetric(vertical: R.dimen.dp14),
                              child: Text(measureData.openMode.label),
                            ),
                            for (WindowOpenModeOptionEntity i
                                in measureData.modifyableOpenModeOption)
                              PrimaryButton(
                                  mode: i.selected
                                      ? PrimaryButtonMode.elevatedButton
                                      : PrimaryButtonMode.outlinedButton,
                                  radius: R.dimen.sp4,
                                  constraints: BoxConstraints(
                                      minHeight: R.dimen.dp32,
                                      minWidth: R.dimen.dp85),
                                  text: i.name,
                                  textStyle: TextStyle(fontSize: R.dimen.sp12),
                                  margin: EdgeInsets.only(right: R.dimen.dp10),
                                  onPressed: () {
                                    setState(() {
                                      measureData.modifyableOpenModeOption
                                          .forEach((e) {
                                        e.selected = e == i;
                                      });
                                    });
                                  }),
                          ],
                        );
                      }),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: R.dimen.dp15),
                            padding:
                                EdgeInsets.symmetric(vertical: R.dimen.dp14),
                            child: Text(measureData.size.label)),
                        PrimaryButton(
                          mode: PrimaryButtonMode.materialButton,
                          radius: R.dimen.sp4,
                          constraints: BoxConstraints(
                              minHeight: R.dimen.dp32, minWidth: R.dimen.dp85),
                          text: "${measureData.size.width}",
                          textStyle: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff999999),
                          margin: EdgeInsets.only(right: R.dimen.dp10),
                        ),
                        PrimaryButton(
                          mode: PrimaryButtonMode.materialButton,
                          radius: R.dimen.sp4,
                          constraints: BoxConstraints(
                              minHeight: R.dimen.dp32, minWidth: R.dimen.dp85),
                          text: "${measureData.size.height}",
                          textStyle: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff999999),
                        )
                      ],
                    ),
                    for (WindowChildOpenModeEntity child
                        in measureData.childOpenModes)
                      for (WindowOpenModeEntity o in child.options)
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: R.dimen.dp15),
                                padding: EdgeInsets.symmetric(
                                    vertical: R.dimen.dp14),
                                child: Text(o.size!.label)),
                            PrimaryButton(
                              mode: PrimaryButtonMode.materialButton,
                              radius: R.dimen.sp4,
                              constraints: BoxConstraints(
                                  minHeight: R.dimen.dp32,
                                  minWidth: R.dimen.dp85),
                              text: "${o.size!.width}",
                              textStyle: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.ff999999),
                              margin: EdgeInsets.only(right: R.dimen.dp10),
                            ),
                            PrimaryButton(
                              mode: PrimaryButtonMode.materialButton,
                              radius: R.dimen.sp4,
                              constraints: BoxConstraints(
                                  minHeight: R.dimen.dp32,
                                  minWidth: R.dimen.dp85),
                              text: "${o.size!.height}",
                              textStyle: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.ff999999),
                            )
                          ],
                        ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: R.dimen.dp15),
                          padding: EdgeInsets.symmetric(vertical: R.dimen.dp14),
                          child: Text("${measureData.groundClearance.label}"),
                        ),
                        SizedTextField(
                          initialValue: "${measureData.groundClearance.value}",
                          hintColor: R.color.ffbcbcbc,
                          onChanged: (String val) {
                            measureData.groundClearance.value =
                                double.tryParse(val);
                            // measureData.size.setHeight(val);
                            // onSizeChanged();
                          },
                          decoration: InputDecoration(hintText: "离地距离"),
                        ),
                      ],
                    ),
                  ])))),
    );
  }
}
