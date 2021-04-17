import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_log_model.dart';
import 'package:taoju5_b/domain/repository/order/order_repository.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

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
