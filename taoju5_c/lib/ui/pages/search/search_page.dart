/*
 * @Description: 搜索窗帘
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:02:50
 * @LastEditTime: 2021-05-17 15:07:47
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(R.image.search, color: R.color.ffb4b4b4),
              Container(
                margin: EdgeInsets.only(left: R.dimen.dp3),
                child: Text(
                  "搜索您想找的内容",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: R.dimen.sp10, color: R.color.ffb4b4b4),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: R.color.fff5f5f5),
        ),
        actions: [
          PrimaryButton(
            // size: PrimaryButtonSize.custom,
            onPressed: () {}, text: "搜索",
            // padding: EdgeInsets.zero,
            constraints: BoxConstraints(
                minWidth: R.dimen.dp60,
                maxWidth: R.dimen.dp60,
                minHeight: R.dimen.dp30,
                maxHeight: R.dimen.dp30),
            // constraints: ,
          )
        ],
      ),
    );
  }
}
