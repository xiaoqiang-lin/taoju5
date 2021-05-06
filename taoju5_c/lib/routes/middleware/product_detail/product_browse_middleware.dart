/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-29 18:11:15
 * @LastEditTime: 2021-04-30 09:12:58
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';

class ProductBrowserMiddleware extends GetMiddleware {
  @override
  int? priority;

  ProductBrowserMiddleware({required this.priority});

  late DateTime enterAt;
  late DateTime leaveAt;

  ///单位为秒数
  int minTimeInterval = 3;

  bool hasRecorded = false;
  late String? _id;
  Map<String?, bool> _dict = {};

  @override
  onPageBuildStart(page) {
    enterAt = DateTime.now();
    print(enterAt);
    print(Get.parameters);
    _id = Get.parameters["id"];

    _dict[_id] = false;
    print("进入时间");
    return super.onPageBuildStart(page);
  }

  @override
  void onPageDispose() {
    leaveAt = DateTime.now();
    if (leaveAt.second - enterAt.second > minTimeInterval &&
        !(_dict[_id] ?? true)) {
      _dict[_id] = true;
      record(_id ?? "");
    }
    super.onPageDispose();
  }

  Future record(String id) {
    ProductRepository repository = ProductRepository();
    return repository.addToHistory({"goods_id": id});
  }
}
