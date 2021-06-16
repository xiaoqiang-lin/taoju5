/*
 * @Description: 收藏接口
 * @Author: iamsmiling
 * @Date: 2021-06-08 17:14:19
 * @LastEditTime: 2021-06-08 17:15:49
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/provider/collection_api.dart';

class CollectionRepository {
  CollectionAPI _api = CollectionAPI();

  Future<BaseEntity> collect(Map params) => _api.collect(params);

  Future<BaseEntity> cancelCollect(Map params) => _api.cancelCollect(params);
}
