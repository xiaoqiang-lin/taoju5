/*
 * @Description: 商品筛选模型
 * @Author: iamsmiling
 * @Date: 2021-01-05 20:08:37
 * @LastEditTime: 2021-01-06 09:49:48
 */
import 'package:taoju5/bapp/interface/i_xselectable.dart';
import 'package:taoju5/utils/json_kit.dart';

class ProductFilterTagModelListWrapper {
  List<ProductFilterTagModel> list;
  ProductFilterTagModelListWrapper.fromJson(var data) {
    list = JsonKit.asList(data)
        .map((e) => ProductFilterTagModel.fromJson(e))
        .toList()
        .cast<ProductFilterTagModel>();
  }
}

class ProductFilterTagModel {
  String title;
  String key;
  bool shouldRefresh;
  bool isMultiple;

  List<ProductFilterTagOptionModel> options;

  ProductFilterTagModel.fromJson(Map json) {
    title = json["show_name"];
    key = json["filter_name"];
    shouldRefresh = JsonKit.asBool(json["is_refresh"]);
    isMultiple = JsonKit.asBool(json["is_multiple"]);
    options = JsonKit.asList(json["filter_value"])
        .map((e) => ProductFilterTagOptionModel.fromJson(e))
        .cast<ProductFilterTagOptionModel>()
        .toList();
  }
}

class ProductFilterTagOptionModel implements IXSelectable {
  @override
  bool isChecked = false;
  String name;
  String id;

  ProductFilterTagOptionModel.fromJson(Map json) {
    name = json["name"];
    id = "${json["id"]}";
  }
}
