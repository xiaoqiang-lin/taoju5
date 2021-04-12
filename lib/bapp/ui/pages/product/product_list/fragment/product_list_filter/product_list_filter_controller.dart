/*
 * @Description: 商品列表页过滤控制器
 * @Author: iamsmiling
 * @Date: 2020-12-25 16:21:54
 * @LastEditTime: 2021-01-15 14:31:18
 */

import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_filter_tag_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class ProductListFilterController extends GetxController {
  ProductRepository _repository = ProductRepository();

  List<ProductFilterTagModel> tagList = [];

  XLoadState loadState = XLoadState.idle;

  String get categoryType =>
      "${Get.find<ProductListParentController>().currentTabModel.id}";

  Future refreshData(
      {Map params,
      ProductFilterTagModel tag,
      ProductFilterTagOptionModel option}) {
    loadState = XLoadState.idle;
    update();

    return _repository.filterTag(params: params).then((value) {
      tagList = value.list;

      ///恢复选中状态
      for (int i = 0; i < tagList.length; i++) {
        ProductFilterTagModel e = tagList[i];
        if (e.key == tag.key) {
          for (ProductFilterTagOptionModel o in tag.options) {
            o.isChecked = o.id == option.id;
          }
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

  Future loadData({Map params}) {
    loadState = XLoadState.idle;
    update();
    return _repository.filterTag(params: params).then((value) {
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
    option.isChecked = !option.isChecked;

    if (!tag.isMultiple) {
      for (ProductFilterTagOptionModel e in tag.options) {
        e.isChecked = e.id == option.id;
      }
    }

    if (tag.shouldRefresh) {
      refreshData(params: {
        "category_type": categoryType,
        tag.key: [option.id]
      }, tag: tag, option: option);
      return;
    }
    update();
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
    Map<String, List> map = {};
    tagList.forEach((tag) {
      if (map[tag.key] != null) {
        map[tag.key].addAll(
            tag.options.where((e) => e.isChecked).map((e) => e.id).toList());
      } else {
        map.addAll({
          tag.key:
              tag.options.where((e) => e.isChecked).map((e) => e.id).toList()
        });
      }
    });
    return map;
  }

  ///确认
  void confirm() {
    Get.find<ProductListParentController>().productListController.refreshData(
        parameters: {
          "filter_condition": jsonEncode(filterParams)
        }).then((value) {
      Get.back();
    });
  }

  @override
  void onInit() {
    loadData(params: {"category_type": "$categoryType"});
    super.onInit();
  }
}
