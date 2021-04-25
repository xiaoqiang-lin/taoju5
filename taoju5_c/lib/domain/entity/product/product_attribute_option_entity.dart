/*
 * @Description: 商品属性选择项
 * @Author: iamsmiling
 * @Date: 2021-04-25 09:48:47
 * @LastEditTime: 2021-04-25 10:01:44
 */
///属性类型
enum ProductAttributeType {
  ///测量数据
  MeasurementDataType,

  ///窗帘配套
  CurtainMatchingSetType
}

extension ProductAttributeTypeKit on ProductAttributeType {
  String get name =>
      {
        ProductAttributeType.CurtainMatchingSetType: "窗帘配套",
        ProductAttributeType.MeasurementDataType: "测量数据"
      }[this] ??
      "";
}

class ProductAttributeOptionEntity {
  int? id;
  int? type;
}
