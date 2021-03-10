/*
 * @Description: 用户分类模型
 * @Author: iamsmiling
 * @Date: 2021-01-07 13:36:48
 * @LastEditTime: 2021-01-07 13:39:06
 */

import 'package:azlistview/azlistview.dart';
import 'package:flutter/foundation.dart';

class CustomerCategoryModel implements ISuspensionBean {
  String icon;
  String name;
  int count;

  ///[type]客户类别
  int type;

  CustomerCategoryModel(
      {@required this.icon,
      @required this.name,
      @required this.count,
      @required this.type});

  @override
  bool isShowSuspension = false;

  @override
  String getSuspensionTag() => "";
}
