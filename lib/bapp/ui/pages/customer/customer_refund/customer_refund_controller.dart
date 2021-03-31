import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerRefundController extends GetxController {
  OrderRepository _repository = OrderRepository();

  List<OrderModel> orderList = [];

  XLoadState loadState = XLoadState.busy;
  RefreshController refreshController;

  String customerId;

  Future loadData() {
    loadState = XLoadState.busy;

    update();
    return _repository.orderList(params: {
      "client_uid": customerId,
      "status": "10,11,-1,-2",
      "page": 1,
      "page_size": 10,
    }).then((OrderModelListWrapper wrapper) {
      orderList = wrapper.orderModelList;
      if (GetUtils.isNullOrBlank(wrapper.orderModelList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    super.onInit();
    customerId = Get.parameters["customerId"];
    refreshController = RefreshController();
    loadData();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
