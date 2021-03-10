/*
 * @Description: 清除搜索记录
 * @Author: iamsmiling
 * @Date: 2021-02-02 14:34:14
 * @LastEditTime: 2021-02-02 16:42:02
 */
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/search/search_controller.dart';

Future<bool> showClearSearchHistoryDialog() {
  return showDialog<bool>(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "清空搜索记录",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("你确定要清空搜索记录吗?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("取消"),
                  ),
                  SizedBox(
                    width: BDimens.gap56,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("++____");
                      Get.find<SearchController>().clear();
                    },
                    child: Text("确定"),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
