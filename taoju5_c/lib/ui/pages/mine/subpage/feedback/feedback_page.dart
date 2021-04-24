/*
 * @Description: 意见反馈页面
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:35:08
 * @LastEditTime: 2021-04-22 18:00:01
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/params/feedback/feedback_params.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_controller.dart';

import 'fragment/bug_feedback_fragment.dart';
import 'fragment/function_suggestion_fragment.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("意见反馈"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kTextTabBarHeight),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: R.dimen.dp72),
                child: TabBar(controller: _.tabController, tabs: [
                  for (FeedbackType item in _.feedbackTypes)
                    Tab(text: item.name)
                ]),
              ),
            ),
          ),
          body: TabBarView(
              controller: _.tabController,
              children: [BugFeedbackFragment(), FunctionSuggestionFragment()]),
          bottomNavigationBar: Container(
            width: Get.width,
            height: kBottomNavigationBarHeight,
            margin: EdgeInsets.only(
                top: R.dimen.dp8,
                left: R.dimen.dp20,
                right: R.dimen.dp20,
                bottom: R.dimen.dp20),
            child: PrimaryButton(
              onPressed: _.submit,
              text: "提交反馈",
            ),
          ),
        );
      },
    );
  }
}
