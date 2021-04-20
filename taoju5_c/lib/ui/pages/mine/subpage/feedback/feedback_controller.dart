/*
 * @Description: 意见反馈逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:35:38
 * @LastEditTime: 2021-04-19 13:28:08
 */
import 'package:get/get.dart';

///反馈类型分为两类
enum FeedbackType { bug, suggestion }

extension FeedbackTypeKit on FeedbackType {
  String? get name =>
      {FeedbackType.bug: "使用问题", FeedbackType.suggestion: "建议"}[this];
}

class FeedbackController extends GetxController {
  List<FeedbackType> feedbackTypes = [
    FeedbackType.bug,
    FeedbackType.suggestion
  ];
}
