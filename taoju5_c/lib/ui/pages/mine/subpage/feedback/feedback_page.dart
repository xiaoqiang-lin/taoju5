/*
 * @Description: 意见反馈页面
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:35:08
 * @LastEditTime: 2021-04-19 09:51:49
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_controller.dart';

import 'fragment/bug_feedback_fragment.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      builder: (_) {
        return DefaultTabController(
          length: _.feedbackTypes.length,
          child: Scaffold(
              appBar: PrimaryAppBar(
                title: "意见反馈",
                bottom: TabBar(tabs: [
                  for (FeedbackType item in _.feedbackTypes)
                    Tab(text: item.name)
                ]),
              ),
              body: TabBarView(children: [BugFeedbackFragment(), Container()])),
        );
      },
    );
  }
}
