import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_mainfest_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class OrderMainfestController extends GetxController {
  OrderRepository _repository = OrderRepository();
  OrderMainfestModel mainfest;
  XLoadState loadState = XLoadState.busy;
  Future loadData() {
    String id = Get.parameters["id"];
    loadState = XLoadState.busy;
    update();
    return _repository
        .mainfest(params: {"order_id": id}).then((OrderMainfestModel value) {
      mainfest = value;
      loadState = XLoadState.idle;
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
