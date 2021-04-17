/*
 * @Description: 加载中
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:18:22
 * @LastEditTime: 2021-01-22 23:02:58
 */

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class XLoadingWidget extends StatelessWidget {
  const XLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitFadingCircle(
        color: Colors.grey,
        size: 48,
      ),
    );
  }
}
