/*
 * @Description: 价格计算代理
 * @Author: iamsmiling
 * @Date: 2021-05-12 14:49:09
 * @LastEditTime: 2021-05-12 16:08:40
 */
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

///所有价格计算的代理类基类
abstract class BaseProductPriceDelegator {
  ///商品
  late ProductDetailEntity product;

  double get totalPrice;

  BaseProductPriceDelegator(this.product);
}

///窗帘类商品的基类
abstract class BaseCurtainProductPriceDelegator
    extends BaseProductPriceDelegator {
  ///窗帘商品属性
  late CurtainAttributeEntity attribute;

  BaseCurtainProductPriceDelegator(ProductDetailEntity product,
      {required this.attribute})
      : super(product);

  ///商品单价
  double get unitPrice => product.price;
  //[foldingFactor]褶皱系数:至于什么是褶皱系数 我也不知道
  double foldingFactor = 2.0;

  ///宽度 单位为cm
  double get width => attribute.measureData.size.width ?? 0;

  ///高度 单位为cm
  double get height => attribute.measureData.size.width ?? 0;

  double get widthM => width / 100;

  double get heightM => height / 100;

  double get thresholdHeightM => product.thresholdHeight;

  ///窗纱面积
  double get area {
    double _area = widthM * heightM;
    return _area > 0
        ? _area < 1
            ? 1
            : _area
        : 0;
  }
}

class FabriceCurtainProductPriceDelegator
    extends BaseCurtainProductPriceDelegator {
  FabriceCurtainProductPriceDelegator(
      ProductDetailEntity product, CurtainAttributeEntity attribute)
      : super(product, attribute: attribute);

  double get unitPrice => product.price;

  ///窗纱的价格
  double get gauzePrice =>
      attribute.matchingSet.gauze.selectedOption?.price ?? 0;

  ///是否有窗纱
  bool get hasGauze => attribute.matchingSet.hasGauze;

  ///型材价格
  double get sectionalbarPrice =>
      attribute.matchingSet.sectionalbar.selectedOption?.price ?? 0;

  ///里布价格
  double get ribouxPrice =>
      attribute.matchingSet.riboux.selectedOption?.price ?? 0;

  ///窗幔价格
  double get valancePrice =>
      attribute.matchingSet.valance.selectedOption?.price ?? 0;

  ///配饰价格
  double get accessoryPrice => attribute.matchingSet.accessoryPrice;

  double get heightFactor {
    return heightM > thresholdHeightM ? 1.5 : 0;
  }

  //窗帘主布高度因子
  double get mainHeightFactor {
    double factor = 1.0;

    if (heightM > thresholdHeightM && product.isCustomSize) {
      factor = (widthM + heightM - 2.65) / widthM;
    }
    return factor;
  }

  ///[mainCurtainClothPrice]窗帘主布价格
  double get mainCurtainClothPrice {
    ///窗帘定高计算
    if (product.isFixedHeight) {
      return widthM * foldingFactor * heightFactor * unitPrice;
    }

    ///窗帘定宽计算
    if (product.isFixedWidth) {
      ///如果窗帘定宽且拼花
      if (product.hasFlower) {
        return unitPrice *
            ((widthM * foldingFactor / (product.doorWidthM)).ceil() *
                ((heightM + 0.2) / (product.flowerSizeM)).ceil() *
                product.flowerSizeM);
      }

      ///如果窗帘定宽但不拼花
      return unitPrice *
          ((widthM * foldingFactor / product.doorWidthM).ceil() *
              ((heightM + 0.2)));
    }

    ///自定义宽高
    return widthM * foldingFactor * mainHeightFactor * unitPrice;
  }

  @override
  double get totalPrice {
    double tmp = unitPrice;

    ///如果有窗纱
    if (hasGauze) {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalbarPrice * widthM * foldingFactor +
          accessoryPrice;
    } else {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalbarPrice * widthM +
          accessoryPrice;
    }

    return tmp;
  }
}
