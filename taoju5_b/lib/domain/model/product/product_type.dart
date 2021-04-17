/*
 * @Description: 商品类型
 * @Author: iamsmiling
 * @Date: 2020-12-28 22:09:16
 * @LastEditTime: 2020-12-31 09:49:31
 */

abstract class BaseProductType {}

abstract class CurtainProductType extends BaseProductType {}

abstract class FinishedProductType extends BaseProductType {}

class FabricCurtainProductType extends CurtainProductType {}

class RollingCurtainProductType extends CurtainProductType {}

class GauzeCurtainProductType extends CurtainProductType {}

///型材
class SectionalbarProductType extends FinishedProductType {}

///布料家具制品 床品 抱枕 沙发 搭毯等
class FabricFurnitureProductType extends FinishedProductType {}

BaseProductType getProductType(int code) {
  Map<int, BaseProductType> dict = {
    0: FabricFurnitureProductType(),
    1: FabricCurtainProductType(),
    2: RollingCurtainProductType(),
    3: GauzeCurtainProductType(),
    4: SectionalbarProductType()
  };
  return dict[code] ?? dict[1];
}
