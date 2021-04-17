/*
 * @Description:收藏夹控制器
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:43:56
 * @LastEditTime: 2021-01-07 17:43:57
 */
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/product_collection_model.dart';
import 'package:taoju5_b/domain/repository/product/product_repository.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

class CollectionController extends GetxController {
  ProductRepository _repository = ProductRepository();

  String id = Get.parameters["id"];

  List<ProductCollectionModel> collectionList = [];

  XLoadState loadState = XLoadState.busy;

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.collection(params: {"client_uid": id}).then(
        (List<ProductCollectionModel> value) {
      collectionList = value;
      if (GetUtils.isNullOrBlank(collectionList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future removeFromCollection({ProductCollectionModel product}) {
    return _repository.removeFromCollection(params: {
      "client_uid": id,
      "fav_type": "goods",
      "fav_id": product.productId
    }).then((value) {
      collectionList.remove(product);
      if (GetUtils.isNullOrBlank(collectionList)) {
        loadState = XLoadState.empty;
      }
      update();
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
