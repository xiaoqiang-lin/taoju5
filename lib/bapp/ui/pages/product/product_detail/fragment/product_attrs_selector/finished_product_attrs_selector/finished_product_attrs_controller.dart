/*
 * @Description: 控制器
 * @Author: iamsmiling
 * @Date: 2021-01-15 23:03:21
 * @LastEditTime: 2021-01-23 13:34:06
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class FinishedProductAttrsController extends GetxController {
  ProductDetailModel product;
  int id;
  FinishedProductAttrsController({this.product, this.id});

  ProductRepository _repository = ProductRepository();
  XLoadState loadState = XLoadState.idle;

  ///当前选中的规则属性
  String get currentSpecValue => product.currentSpecOptionName;
  Future _loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.productDetail(params: {"goods_id": id}).then(
        (ProductDetailModelWrapper wrapper) {
      product = wrapper.product;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    if (product == null) {
      _loadData();
    }
    super.onInit();
  }

  void select(ProductSpecOptionModel option) {
    option.isChecked = !option.isChecked;
    update();
  }

  void validate() {}
}
