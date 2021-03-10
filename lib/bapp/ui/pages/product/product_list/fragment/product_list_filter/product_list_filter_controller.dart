/*
 * @Description: 商品列表页过滤控制器
 * @Author: iamsmiling
 * @Date: 2020-12-25 16:21:54
 * @LastEditTime: 2021-01-15 14:31:18
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_filter_tag_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class ProductListFilterController extends GetxController {
  ProductRepository _repository = ProductRepository();

  List<ProductFilterTagModel> tagList = [];

  XLoadState loadState = XLoadState.idle;

  Future refreshData({Map params, ProductFilterTagModel tag}) {
    loadState = XLoadState.idle;
    update();

    return _repository.filterTag(params: params).then((value) {
      tagList = value.list;

      ///恢复选中状态
      for (int i = 0; i < tagList.length; i++) {
        ProductFilterTagModel e = tagList[i];
        if (e.key == tag.key) {
          tagList[i] = tag;
        }
      }
      if (GetUtils.isNullOrBlank(tagList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future _loadData() {
    loadState = XLoadState.idle;
    update();
    return _repository.filterTag().then((value) {
      tagList = value.list;
      if (GetUtils.isNullOrBlank(tagList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  ///[description]: 选择类别
  ///[params]: [tag]当前筛选条件的分类 [option]当前的选项
  ///[return]:
  void selectOption(
      ProductFilterTagModel tag, ProductFilterTagOptionModel option) {
    if (tag.isMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      for (ProductFilterTagOptionModel e in tag.options) {
        option.isChecked = !option.isChecked;
        if (e.id != option.id) {
          e.isChecked = false;
        }
      }
    }

    if (tag.shouldRefresh) {
      refreshData(params: {
        tag.key: tag.options.where((e) => e.isChecked).map((e) => e.id).toList()
      }, tag: tag);
      return;
    }

    update([tag.key]);
  }

  ///重置
  void reset() {
    for (ProductFilterTagModel tag in tagList) {
      for (ProductFilterTagOptionModel option in tag.options) {
        option.isChecked = false;
      }
    }
    update();
  }

  Map get filterParams {
    if (GetUtils.isNull(tagList)) return {};
    Map map = {};
    tagList.forEach((tag) {
      map.addAll({
        tag.key: tag.options.where((e) => e.isChecked).map((e) => e.id).toList()
      });
    });
    return map;
  }

  ///确认
  void confirm() {
    Get.find<ProductListParentController>()
        .productListController
        .refreshData(params: filterParams)
        .then((value) {
      Get.back();
    });
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }
}
