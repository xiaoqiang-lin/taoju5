import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_model.dart';
import 'package:taoju5_b/domain/repository/order/order_repository.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_bc/extensions/string_kit.dart';

class OrderSearchController extends GetxController {
  OrderRepository _repository = OrderRepository();

  String keyword;
  List<OrderModel> orderList;
  XLoadState loadState = XLoadState.busy;
  RefreshController refreshController;

  int pageIndex = 1;
  Map get params => {"keyword": keyword, "page_index": pageIndex};

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository
        .orderList(params: params)
        .then((OrderModelListWrapper wrapper) {
      orderList = wrapper.orderModelList;
      if (GetUtils.isNullOrBlank(orderList)) {
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
    keyword = "${Get.parameters["keyword"]}".stringDecode();
    refreshController = RefreshController();
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
