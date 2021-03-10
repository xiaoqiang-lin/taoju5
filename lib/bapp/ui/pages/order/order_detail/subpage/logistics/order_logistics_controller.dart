import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class OrderLogisticsController extends GetxController {
  OrderRepository repository = OrderRepository();
  XLoadState loadState;

  PacketLogisticsModelListWrapper logistics;

  Future loadData() {
    String id = Get.parameters["id"];
    loadState = XLoadState.busy;
    update();
    return repository.logistics(params: {"order_id": id}).then(
        (PacketLogisticsModelListWrapper data) {
      logistics = data;
      loadState = XLoadState.idle;
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
