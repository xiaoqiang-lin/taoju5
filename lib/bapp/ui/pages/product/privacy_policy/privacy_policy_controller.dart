/*
 * @Description: 隐私政策
 * @Author: iamsmiling
 * @Date: 2021-09-15 20:31:17
 * @LastEditTime: 2021-09-15 20:38:20
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/user_protocol/privacy_policy_model.dart';
import 'package:taoju5/bapp/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class PrivacyPolicyController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();

  XLoadState loadState = XLoadState.busy;

  PrivacyPolicyModel policy;
  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.privacyPolicy().then((PrivacyPolicyModel value) {
      loadState = XLoadState.idle;
      policy = value;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
