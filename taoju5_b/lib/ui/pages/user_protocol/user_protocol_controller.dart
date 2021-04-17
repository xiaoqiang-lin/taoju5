import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/user_protocol/user_protocol_model.dart';
import 'package:taoju5_b/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

class UserProtocolController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();

  XLoadState loadState = XLoadState.busy;

  UserProtocolModel protocol;
  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.userProtocol().then((UserProtocolModel value) {
      loadState = XLoadState.idle;
      protocol = value;
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
