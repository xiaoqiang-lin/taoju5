/*
 * @Description: 功能建议
 * @Author: iamsmiling
 * @Date: 2021-04-22 17:15:50
 * @LastEditTime: 2021-04-22 17:45:27
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/textfield/filled_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_controller.dart';

class FunctionSuggestionFragment extends StatelessWidget {
  const FunctionSuggestionFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: R.dimen.dp14, bottom: R.dimen.dp10),
                    child: Text("请具体描述问题（必填）", style: R.style.h3)),
                FilledTextField(
                  maxLines: 4,
                  maxLength: 200,
                  onChanged: _.setDecription,
                  inputDecoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.ff999999),
                    hintText: "例如：您在什么页面需要什么功能，可以帮助您完成什么",
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: R.dimen.dp14, bottom: R.dimen.dp10),
                    child: Text("您的联系方式（必填）", style: R.style.h3)),
                FilledTextField(
                    height: R.dimen.dp36,
                    padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                    inputDecoration: InputDecoration(
                      hintText: "请输入手机号/邮箱",
                    ),
                    onChanged: _.setTelephone),
              ],
            ),
          ),
        );
      },
    );
  }
}
