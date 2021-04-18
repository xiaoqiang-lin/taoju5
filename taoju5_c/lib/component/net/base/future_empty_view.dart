/*
 * @Description: /无数据
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-18 00:12:04
 */
import 'package:flutter/material.dart';

class FutureEmptyView extends StatelessWidget {
  const FutureEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("暂无数据"),
    );
  }
}
