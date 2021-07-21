/*
 * @Description: 门店相关的接口
 * @Author: iamsmiling
 * @Date: 2021-07-21 14:28:14
 * @LastEditTime: 2021-07-21 16:55:10
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/store/store_detail_entity.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/domain/provider/store_api.dart';

class StoreRepository {
  StoreAPI _api = StoreAPI();

  Future<StoreDetailEntity> storeDetail({Map? params}) => _api
      .storeDetail(params: params)
      .then((value) => StoreDetailEntity.fromJson(JsonKit.asMap(value.data)));

  Future<StoreEntityListWrapper> storeList({Map? params}) => _api
      .storeList(params: params)
      .then((value) => StoreEntityListWrapper.fromJson(value.data));

  Future<List<CategoryEntity>> storeTabs({Map? params}) =>
      _api.storeTabs(params: params).then((value) => JsonKit.asList(value.data)
          .map((e) => CategoryEntity.fromJson(e))
          .toList());
}
