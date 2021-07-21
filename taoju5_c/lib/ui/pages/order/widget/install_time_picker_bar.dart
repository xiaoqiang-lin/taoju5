/*
 * @Description: 安装时间选择
 * @Author: iamsmiling
 * @Date: 2021-05-06 15:56:45
 * @LastEditTime: 2021-07-17 16:01:49
 */
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/readonly_text_form_field.dart';
import 'package:taoju5_c/res/R.dart';

class InstallTimePickerBar extends StatefulWidget {
  final Function(String?)? onValueChanged;
  InstallTimePickerBar({Key? key, this.onValueChanged}) : super(key: key);

  @override
  _InstallTimePickerBarState createState() => _InstallTimePickerBarState();
}

class _InstallTimePickerBarState extends State<InstallTimePickerBar> {
  String? _value;

  DateTime? initialValue;

  void _select() {
    _showInstallTimePicker(context, initialValue: initialValue).then((value) {
      setState(() {
        initialValue = value;
        _value = CommonKit.formatDateTime(value, format: "yyyy-MM-dd");
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(
              CommonKit.formatDateTime(value, format: "yyyy-MM-dd"));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: R.dimen.dp15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "意向上门安装时间",
            style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
          ),
          GestureDetector(
            onTap: _select,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${_value ?? "请选择期望上门时间"}",
                  style: _value == null
                      ? TextStyle(
                          fontSize: R.dimen.sp11,
                          color: R.color.ff999999,
                        )
                      : TextStyle(
                          fontSize: R.dimen.sp14, color: R.color.ff333333),
                ),
                Image.asset(R.image.next)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<DateTime?> _showInstallTimePicker(BuildContext context,
    {DateTime? initialValue}) {
  return showDialog<DateTime?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: R.dimen.dp48),
          child: _InstallTimePickerView(
            initialValue: initialValue,
          ),
        );
      });
}

class _InstallTimePickerView extends StatefulWidget {
  final DateTime? initialValue;
  const _InstallTimePickerView({Key? key, this.initialValue}) : super(key: key);

  @override
  _InstallTimePickerViewState createState() => _InstallTimePickerViewState();
}

class _InstallTimePickerViewState extends State<_InstallTimePickerView> {
  late List<int> yearOptions;
  late List<int> monthOptions;
  late List<int> dateOptions;

  late int currentYear;
  late int currentMonth;
  late int currentDate;

  late StreamController<List<int>> monthController;
  late StreamController<List<int>> dateController;

  ///传入一个月份计算当前月可预约的有哪几天
  List<int> caluldateDays(int month) {
    List<int> day31Months = [1, 3, 5, 7, 8, 10, 12];
    List<int> day30Months = [4, 6, 9, 11];
    DateTime now = DateTime.now();
    int days = 0;
    if (day31Months.contains(month)) {
      days = 31;
    }
    if (day30Months.contains(month)) {
      days = 30;
    }

    if (month == 2) {
      days = (now.year % 4 == 0 && now.year % 100 != 0) || (now.year % 400 == 0)
          ? 29
          : 28;
    }
    if (month == now.month) {
      days = days - now.day;
    }
    return month == now.month
        ? List.generate(days + 1, (index) => index + now.day)
        : List.generate(days, (index) => index + 1);
  }

  List<int> caculateMonth(int year) {
    DateTime now = DateTime.now();

    return year != now.year
        ? List.generate(12, (index) => index + 1)
        : List.generate(12 - now.month + 1, (index) => now.month + index);
  }

  List<int> caculateYears() {
    DateTime now = DateTime.now();
    return [now.year, now.year + 1];
  }

  late FixedExtentScrollController yearFixedExtentScrollController;
  late FixedExtentScrollController monthFixedExtentScrollController;
  late FixedExtentScrollController dateFixedExtentScrollController;

  @override
  void initState() {
    super.initState();
    DateTime now = widget.initialValue ?? DateTime.now();
    yearOptions = caculateYears();
    monthOptions = caculateMonth(now.year);
    dateOptions = caluldateDays(now.month);
    currentYear = now.year;
    currentMonth = now.month;
    currentDate = now.day;
    monthController = StreamController<List<int>>();
    dateController = StreamController<List<int>>();
    int yearIndex = yearOptions.indexOf(now.year);
    int monthIndex = monthOptions.indexOf(now.month);
    int dateIndex = dateOptions.indexOf(now.day);
    yearFixedExtentScrollController = FixedExtentScrollController(
        initialItem: yearIndex == -1 ? 0 : yearIndex);
    monthFixedExtentScrollController = FixedExtentScrollController(
        initialItem: monthIndex == -1 ? 0 : monthIndex);

    dateFixedExtentScrollController = FixedExtentScrollController(
        initialItem: dateIndex == -1 ? 0 : dateIndex);
  }

  @override
  void dispose() {
    monthController.close();
    dateController.close();
    super.dispose();
  }

  onYearChanged(int i) {
    currentYear = yearOptions[i];
    currentMonth = caculateMonth(currentYear).first;
    monthController.add(caculateMonth(currentYear));
    dateController.add(caluldateDays(currentMonth));
  }

  onMonthChanged(int i, List<int> options) {
    currentMonth = options[i];
    dateController.add(caluldateDays(currentMonth));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp14),
            child: Text(
              "请选择上门安装时间",
              style: TextStyle(
                  fontSize: R.dimen.sp15,
                  color: R.color.ff1b1b1b,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Container(
              height: R.dimen.dp184,
              child: Row(
                children: [
                  Flexible(
                      child: CupertinoPicker.builder(
                    itemExtent: 30,
                    childCount: yearOptions.length,
                    scrollController: yearFixedExtentScrollController,
                    onSelectedItemChanged: onYearChanged,
                    itemBuilder: (BuildContext context, int i) {
                      return Center(
                        child: Text(
                          "${yearOptions[i]}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ff333333),
                        ),
                      );
                    },
                  )),
                  Flexible(
                      child: StreamBuilder<List<int>>(
                          stream: monthController.stream,
                          initialData: monthOptions,
                          builder: (context, snapshot) {
                            return CupertinoPicker.builder(
                              itemExtent: 30,
                              scrollController:
                                  monthFixedExtentScrollController,
                              childCount: snapshot.data!.length,
                              onSelectedItemChanged: (int i) =>
                                  onMonthChanged(i, snapshot.data!),
                              itemBuilder: (BuildContext context, int i) {
                                return Center(
                                    child: Text(
                                  "${snapshot.data![i]}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp14,
                                      color: R.color.ff333333),
                                ));
                              },
                            );
                          })),
                  Flexible(
                      child: StreamBuilder<List<int>>(
                          stream: dateController.stream,
                          initialData: dateOptions,
                          builder: (context, snapshot) {
                            return CupertinoPicker.builder(
                              itemExtent: 30,
                              scrollController: dateFixedExtentScrollController,
                              childCount: snapshot.data!.length,
                              onSelectedItemChanged: (int i) {
                                currentDate = snapshot.data![i];
                              },
                              itemBuilder: (BuildContext context, int i) {
                                return Center(
                                    child: Text(
                                  "${snapshot.data![i]}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp14,
                                      color: R.color.ff333333),
                                ));
                              },
                            );
                          })),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: "取消",
                  onPressed: Navigator.of(context).pop,
                  mode: PrimaryButtonMode.materialButton,
                  size: PrimaryButtonSize.middle,
                ),
                PrimaryButton(
                  text: "确定",
                  margin: EdgeInsets.only(left: R.dimen.dp10),
                  onPressed: () => Navigator.of(context).pop(DateTime.parse(
                      "$currentYear-${currentMonth.toString().padLeft(2, '0')}-${currentDate.toString().padLeft(2, '0')}")),
                  mode: PrimaryButtonMode.elevatedButton,
                  size: PrimaryButtonSize.middle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
