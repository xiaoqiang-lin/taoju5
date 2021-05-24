/*
 * @Description: 下拉控制器
 * @Author: iamsmiling
 * @Date: 2021-05-20 09:31:20
 * @LastEditTime: 2021-05-20 09:32:01
 */

import 'package:flutter/material.dart';

class DropSelectController extends ChangeNotifier {
  late DropSelectEvent event;

  late int menuIndex;

  late int index;

  dynamic data;

  void hide() {
    event = DropSelectEvent.HIDE;
    notifyListeners();
  }

  void show(int index) {
    event = DropSelectEvent.ACTIVE;
    menuIndex = index;
    notifyListeners();
  }

  void select(dynamic data, {required int index}) {
    event = DropSelectEvent.SELECT;
    this.data = data;
    this.index = index;
    notifyListeners();
  }
}

enum DropSelectEvent {
  SELECT,
  ACTIVE,
  HIDE,
}
