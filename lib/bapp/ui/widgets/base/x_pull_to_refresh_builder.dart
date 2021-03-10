/*
 * @Description: 下拉刷新二次封装
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:16:35
 * @LastEditTime: 2020-12-21 14:24:29
 */

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class XPullToRefreshBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final Map params;
  final RefreshController controller;
  final BoxScrollView scrollViewBuilder;
  const XPullToRefreshBuilder(
      {Key key,
      @required this.itemBuilder,
      this.params = const {},
      @required this.controller,
      this.scrollViewBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
    );
  }
}
