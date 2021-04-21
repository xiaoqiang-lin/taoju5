/*
 * @Description: bug反馈
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:49:56
 * @LastEditTime: 2021-04-19 12:31:22
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
              Text("请具体描述问题（必填）"),
              FilledTextField(
                maxLines: 4,
                maxLength: 200,
                inputDecoration: InputDecoration(
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
              Text("上传凭证（非必填）"),

              Container(
                width: double.maxFinite,
                height: R.dimen.dp80,
                padding: EdgeInsets.all(R.dimen.dp10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(R.dimen.sp7),
                    color: R.color.fff5f5f5),
                child: UploadImageButton(),
              )
            ],
          ),
        ));
      },
    );
  }
}
