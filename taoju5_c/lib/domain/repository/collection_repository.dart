/*
 * @Description: 收藏接口
 * @Author: iamsmiling
 * @Date: 2021-06-08 17:14:19
 * @LastEditTime: 2021-07-16 15:30:02
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/provider/collection_api.dart';

class CollectionRepository {
  CollectionAPI _api = CollectionAPI();

  Future<BaseEntity> collect(Map params) => _api.collect(params);

  Future<BaseEntity> cancelCollect(Map params) => _api.cancelCollect(params);

  ///商品收藏列表
  Future<List<ProductEntity>> productCollection({Map? params}) =>
      _api.productCollection(params: params).then((value) {
        return JsonKit.asList(value.data is Map ? value.data["data"] : [])
            .map((e) => ProductEntity.fromJson(e))
            .toList();
      });

  ///文章收藏列表
  Future<List<CourseEntity>> articleCollection({Map? params}) =>
      _api.articleCollection(params: params).then((value) {
        return JsonKit.asList(value.data is Map ? value.data["data"] : [])
            .map((e) => CourseEntity.fromJson(e))
            .toList();
      });
}
