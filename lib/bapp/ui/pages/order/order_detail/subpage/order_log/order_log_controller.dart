import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_log_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class OrderLogController extends GetxController {
  OrderRepository _repository = OrderRepository();
  XLoadState loadState = XLoadState.busy;
  OrderLogModel orderLog;

  Future loadData() {
    loadState = XLoadState.busy;
    return _repository.orderLog(
        params: {"order_id": Get.parameters["id"]}).then((OrderLogModel value) {
      loadState = XLoadState.idle;
      orderLog = value;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
