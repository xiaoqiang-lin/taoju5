/*
 * @Description: 问题反馈页面
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:53:03
 * @LastEditTime: 2021-01-09 20:53:50
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/taojuwu/taojuwu_repository.dart';

class FeedbackParamsModel {
  String description;
  String contract;

  FeedbackParamsModel({this.contract, this.description});

  Map get params =>
      {"consult_content": description, "consult_contact": contract};
}

class FeedBackController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();
  FeedbackParamsModel args = FeedbackParamsModel();

  setDescription(String val) {
    args.description = val;
  }

  setContract(String val) {
    args.contract = val;
  }

  Future submit() {
    return _repository.feedback(args.params);
  }
}
