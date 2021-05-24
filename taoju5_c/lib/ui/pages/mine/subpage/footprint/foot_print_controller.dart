/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:56:38
 * @LastEditTime: 2021-05-19 11:11:14
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/footprint/footprint_entity.dart';

class FootPrintController
    extends BaseFutureLoadStateController<List<FootPrintEntity>> {
  late List<FootPrintEntity> footprints;
  @override
  Future<List<FootPrintEntity>> loadData({Map? params}) {
    footprints = [FootPrintEntity.fromJson({})];
    return Future.value([FootPrintEntity.fromJson({})]);
  }
}
