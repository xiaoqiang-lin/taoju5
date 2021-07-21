/*
 * @Description: 反馈
 * @Author: iamsmiling
 * @Date: 2021-04-22 14:58:52
 * @LastEditTime: 2021-07-16 10:58:45
 */
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

///反馈类型分为两类
enum FeedbackType { bug, suggestion }

extension FeedbackTypeKit on FeedbackType {
  String? get name =>
      {FeedbackType.bug: "使用问题", FeedbackType.suggestion: "功能建议"}[this];

  int? get code => {FeedbackType.bug: 1, FeedbackType.suggestion: 2}[this];
}

class FeedbackParamsEntity extends BaseParamsEntity {
  FeedbackType feedbackType = FeedbackType.bug;
  String? description;
  String? telephone;
  late Map formData = {};

  @override
  Map get params => {
        "feedback_type": feedbackType.code,
        "question": description,
        "contact_details": telephone,
      };

  @override
  bool validate() => true;
}
