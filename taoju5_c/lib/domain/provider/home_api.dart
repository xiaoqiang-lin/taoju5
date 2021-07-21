/*
 * @Description: 首页接口
 * @Author: iamsmiling
 * @Date: 2021-07-20 16:22:54
 * @LastEditTime: 2021-07-20 16:26:56
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class HomeAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> home() => _http.get("/app/index/index");
}
