import 'package:taoju5/capp/component/net/future_loadstate_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class FutureRefreshListController
    extends FutureLoadStateController<List> {
  RefreshController refreshController;

  @override
  void onInit() {
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
