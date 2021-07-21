/*
 * @Description: bug反馈
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:49:56
 * @LastEditTime: 2021-07-16 10:47:28
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/upload_image_button.dart';
import 'package:taoju5_c/component/textfield/filled_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_controller.dart';

class BugFeedbackFragment extends StatelessWidget {
  const BugFeedbackFragment({Key? key}) : super(key: key);

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
                  margin:
                      EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp10),
                  child: Text("请具体描述问题（必填）", style: R.style.h3)),
              FilledTextField(
                maxLines: 4,
                maxLength: 200,
                onChanged: _.setDecription,
                inputDecoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.ff999999),
                  hintText: "例如：您在什么页面进行了什么操作，遇到了什么问题",
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: R.dimen.sp7),
              //   padding: EdgeInsets.all(R.dimen.dp10),
              //   decoration: BoxDecoration(
              //       color: R.color.fff5f5f5,
              //       borderRadius: BorderRadius.circular(7)),
              //   child: TextFormField(
              //       maxLines: 4,
              //       maxLength: 200,
              //       decoration: InputDecoration(
              //           hintText: "例如：您在什么页面进行了什么操作，遇到了什么问题",
              //           border: InputBorder.none,
              //           contentPadding: EdgeInsets.zero,
              //           enabledBorder: InputBorder.none,
              //           focusedBorder: InputBorder.none,
              //           counterStyle: TextStyle(
              //               fontSize: R.dimen.sp10,
              //               color: R.color.ff999999))),
              // ),
              Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp10),
                  child: Text("上传凭证（非必填）", style: R.style.h3)),

              UploadImageButton(),

              Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp10),
                  child: Text("您的联系方式（必填）", style: R.style.h3)),

              FilledTextField(
                height: R.dimen.dp36,
                padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                inputDecoration: InputDecoration(
                  hintText: "请输入手机号/邮箱",
                ),
                onChanged: _.setTelephone,
              ),
            ],
          ),
        ));
      },
    );
  }
}
