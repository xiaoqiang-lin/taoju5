/*
 * @Description: 首页接口
 * @Author: iamsmiling
 * @Date: 2021-07-20 16:24:13
 * @LastEditTime: 2021-07-20 16:51:11
 */
import 'package:taoju5_c/domain/entity/home/home_entity.dart';
import 'package:taoju5_c/domain/provider/home_api.dart';

class HomeRepository {
  HomeAPI _api = HomeAPI();

  Future<HomeEntity> home() =>
      _api.home().then((value) => HomeEntity.fromJson(value.data));
}
