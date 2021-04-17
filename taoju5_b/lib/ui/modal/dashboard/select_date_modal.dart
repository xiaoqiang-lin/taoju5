import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/modal/dashboard/select_date_modal_controller.dart';

Future showSelectDateModal() {
  return showCupertinoModalPopup(
      context: Get.context,
      builder: (BuildContext context) {
        return Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: Get.width,
            height: .72 * Get.height,
            child: GetBuilder<SelectDateModalController>(
                init: SelectDateModalController(),
                builder: (_) {
                  return Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: Get.back,
                              child: Text(
                                "取消",
                                style: TextStyle(fontSize: BDimens.sp28),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "选择时间",
                              style: TextStyle(
                                  fontSize: BDimens.sp32,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: () => Get.back(result: {
                                      "year": _.currentYear,
                                      "month": _.currentMonth,
                                      "mode": _.selectMode
                                    }),
                                child: Text(
                                  "确定",
                                  style: TextStyle(fontSize: BDimens.sp28),
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      GetBuilder<SelectDateModalController>(
                          id: "mode",
                          builder: (_) {
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: BDimens.gap48),
                                  alignment: Alignment.center,
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (_.selectMode ==
                                          SelectDateMode.byMonth)
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => _.switchMode(
                                                  SelectDateMode.byMonth),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: BDimens.gap12,
                                                    horizontal: BDimens.gap32),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(4),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4)),
                                                    color: BColors.buttonColor),
                                                child: Text(
                                                  "按月",
                                                  style: TextStyle(
                                                      fontSize: BDimens.sp28,
                                                      color:
                                                          BColors.primaryColor),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => _.switchMode(
                                                  SelectDateMode.byYear),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: BDimens.gap12,
                                                    horizontal: BDimens.gap32),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(4),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4)),
                                                    color:
                                                        BColors.primaryColor),
                                                child: Text(
                                                  "按年",
                                                  style: TextStyle(
                                                      fontSize: BDimens.sp28,
                                                      color: BColors.textColor),
                                                ),
                                              ),
                                            ),
                                            // ElevatedButton(
                                            //     onPressed: () => _.switchMode(
                                            //         SelectDateMode.byMonth),
                                            //     child: Text("按月")),
                                          ],
                                        )
                                      else
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => _.switchMode(
                                                  SelectDateMode.byMonth),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: BDimens.gap12,
                                                    horizontal: BDimens.gap32),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(4),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4)),
                                                    color:
                                                        BColors.primaryColor),
                                                child: Text(
                                                  "按月",
                                                  style: TextStyle(
                                                      fontSize: BDimens.sp28,
                                                      color:
                                                          BColors.buttonColor),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => _.switchMode(
                                                  SelectDateMode.byYear),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: BDimens.gap12,
                                                    horizontal: BDimens.gap32),
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(4),
                                                            topRight:
                                                                Radius.circular(
                                                                    4)),
                                                    color: BColors.buttonColor),
                                                child: Text(
                                                  "按年",
                                                  style: TextStyle(
                                                      fontSize: BDimens.sp28,
                                                      color:
                                                          BColors.primaryColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                                if (_.selectMode == SelectDateMode.byMonth)
                                  Container(
                                    width: Get.width,
                                    height: 240,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: CupertinoPicker.builder(
                                            childCount: _.yearOptionList.length,
                                            onSelectedItemChanged: _.selectYear,
                                            itemBuilder:
                                                (BuildContext context, int i) {
                                              return Center(
                                                  child: Text(
                                                      "${_.yearOptionList[i]}年"));
                                            },
                                            itemExtent: 48,
                                          ),
                                        ),
                                        Flexible(
                                          child: GetBuilder<
                                                  SelectDateModalController>(
                                              id: "month",
                                              builder: (_) {
                                                return CupertinoPicker.builder(
                                                  childCount:
                                                      _.monthOptionList.length,
                                                  onSelectedItemChanged:
                                                      _.selectMonth,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int i) {
                                                    return Center(
                                                        child: Text(
                                                            "${_.monthOptionList[i]}月"));
                                                  },
                                                  itemExtent: 48,
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  )
                                else
                                  Container(
                                    width: Get.width,
                                    height: 240,
                                    child: CupertinoPicker.builder(
                                      childCount: _.yearOptionList.length,
                                      onSelectedItemChanged: _.selectYear,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Center(
                                            child: Text(
                                                "${_.yearOptionList[i]}年"));
                                      },
                                      itemExtent: 48,
                                    ),
                                  )
                              ],
                            );
                          }),
                    ],
                  );
                }),
          ),
        );
      });
}
