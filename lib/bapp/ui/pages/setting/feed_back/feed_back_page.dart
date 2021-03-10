/*
 * @Description: 问题反馈
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:51:29
 * @LastEditTime: 2021-01-09 20:52:39
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/setting/feed_back/feed_back_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

class FeedBackPage extends GetView<FeedBackController> {
  const FeedBackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("问题反馈"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
                child: Text(
                  "问题反馈",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: BDimens.sp32),
                ),
              ),
              Container(
                height: 196.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: BColors.inputBorderColor)),
                child: TextField(
                  onChanged: controller.setDescription,
                  decoration: InputDecoration(
                      hintText: "请描述您的问题和意见，感谢支持",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
                child: Text(
                  "联系方式",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: BDimens.sp32),
                ),
              ),
              Container(
                height: 196.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: BColors.inputBorderColor)),
                child: TextField(
                  onChanged: controller.setContract,
                  decoration: InputDecoration(
                      hintText: "请留下您的手机号、微信，以便我们联系您",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(
              horizontal: BDimens.gap16, vertical: BDimens.gap16),
          height: kBottomNavigationBarHeight,
          child: XFutureButton(
            onFuture: controller.submit,
            onSuccess: Get.back,
            child: Text("提交反馈"),
          )),
    );
  }
}
