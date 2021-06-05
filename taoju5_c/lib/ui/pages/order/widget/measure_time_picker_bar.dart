/*
 * @Description: 意向上门量尺时间选择
 * @Author: iamsmiling
 * @Date: 2021-05-06 14:55:46
 * @LastEditTime: 2021-06-01 16:43:59
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/readonly_text_form_field.dart';
import 'package:taoju5_c/res/R.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';

class MeasureTimePickerBar extends StatefulWidget {
  final Function(String?)? onValueChanged;
  MeasureTimePickerBar({Key? key, this.onValueChanged}) : super(key: key);

  @override
  _MeasureTimePickerBarState createState() => _MeasureTimePickerBarState();
}

class _DateTimeQuantum {
  DateTime date;
  String time;

  _DateTimeQuantum({required this.date, required this.time});

  String get dateString => date.difference(DateTime.now()).inDays == 0
      ? "今天"
      : CommonKit.formatDateTime(date, format: "MM-dd");
  @override
  String toString() {
    return CommonKit.formatDateTime(date, format: "yyyy-MM-dd") + " $time";
  }
}

class _MeasureTimePickerBarState extends State<MeasureTimePickerBar> {
  String? _value;

  late String currentDate;
  late String currentTime;

  _DateTimeQuantum? initialValue;

  void _select() {
    _showMeasureTimePicker(context, initialValue: initialValue).then((value) {
      setState(() {
        initialValue = value;
        _value = value?.toString();
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(
              CommonKit.formatDateTime(value?.date, format: "yyyy年MM月dd日") +
                  " ${value?.time}");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: R.dimen.dp10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "意向上门测量时间",
            style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
          ),
          Expanded(
            child: ReadOnlyTextFormField(
                key: ValueKey(_value),
                initialValue: _value,
                hintText: "请选择期望上门时间",
                onTap: _select),
          ),
        ],
      ),
    );
  }
}

Future<_DateTimeQuantum?> _showMeasureTimePicker(BuildContext context,
    {_DateTimeQuantum? initialValue}) {
  return showDialog<_DateTimeQuantum?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: _MeasureTimePickerView(initialValue: initialValue),
        );
      });
}

class _MeasureTimePickerView extends StatefulWidget {
  final _DateTimeQuantum? initialValue;
  const _MeasureTimePickerView({Key? key, this.initialValue}) : super(key: key);

  @override
  _MeasureTimePickerViewState createState() => _MeasureTimePickerViewState();
}

class _MeasureTimePickerViewState extends State<_MeasureTimePickerView> {
  late DateTime now;
  late DateTime currentDate;
  late String currentTime;
  late List<String> dateOptions;
  late List<String> timeOptions = [
    "09:00-10:00",
    "10:00-11:00",
    "11:00-12:00",
    "12:00-13:00",
    "13:00-14:00",
    "14:00-15:00",
    "15:00-16:00",
    "16:00-17:00",
    "17:00-18:00"
  ];

  late FixedExtentScrollController dateController;
  late FixedExtentScrollController timeController;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    dateOptions = List.generate(
        30,
        (index) => CommonKit.formatDateTime(now.add(Duration(days: index)),
            format: "MM-dd"));
    currentDate = now;
    currentTime = timeOptions.first;
    int? dateIndex = dateOptions.indexOf(widget.initialValue?.dateString ?? "");
    int? timeIndex = timeOptions.indexOf(widget.initialValue?.time ?? "");
    dateController = FixedExtentScrollController(
        initialItem: dateIndex == -1 ? 0 : dateIndex);
    timeController = FixedExtentScrollController(
        initialItem: timeIndex == -1 ? 0 : timeIndex);
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp14),
            child: Text(
              "意向上门量尺时间",
              style: TextStyle(
                  fontSize: R.dimen.sp15,
                  color: R.color.ff1b1b1b,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: R.dimen.dp108,
            margin: EdgeInsets.only(bottom: R.dimen.dp20),
            child: Row(
              children: [
                Flexible(
                    child: CupertinoPicker.builder(
                  itemExtent: 36,
                  scrollController: dateController,
                  childCount: dateOptions.length,
                  onSelectedItemChanged: (int i) {
                    currentDate =
                        DateTime.parse("${now.year}-${dateOptions[i]}");
                  },
                  itemBuilder: (BuildContext context, int i) {
                    return Center(
                        child: Text(
                      dateOptions[i],
                      style: TextStyle(
                          fontSize: R.dimen.sp14, color: R.color.ff333333),
                    ));
                  },
                )),
                Flexible(
                    child: CupertinoPicker.builder(
                  itemExtent: 36,
                  scrollController: timeController,
                  childCount: timeOptions.length,
                  onSelectedItemChanged: (int i) {
                    currentTime = timeOptions[i];
                  },
                  itemBuilder: (BuildContext context, int i) {
                    return Center(
                        child: Text(
                      timeOptions[i],
                      style: TextStyle(
                          fontSize: R.dimen.sp14, color: R.color.ff333333),
                    ));
                  },
                ))
              ],
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
                  onPressed: () => Navigator.of(context).pop(
                      _DateTimeQuantum(date: currentDate, time: currentTime)),
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
