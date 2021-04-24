/*
 * @Description: 选择日期
 * @Author: iamsmiling
 * @Date: 2021-04-22 10:05:29
 * @LastEditTime: 2021-04-22 10:13:48
 */
import 'package:flutter/material.dart';

Future<String?> openDatePicker(BuildContext context) {
  return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          title: Text("选择日期"),
        );
      });
}

class DatePicker extends StatefulWidget {
  DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
