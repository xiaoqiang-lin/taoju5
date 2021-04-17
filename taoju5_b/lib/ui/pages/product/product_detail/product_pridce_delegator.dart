/*
 * @Description: 商品价格计算代理
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:43:03
 * @LastEditTime: 2021-02-01 17:01:54
 */

import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/abstract_product_model.dart';

import 'package:taoju5_bc/utils/common_kit.dart';

class BasePoductPriceDelegatorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

///对于成品只需要商品模型即可
abstract class BasePoductPriceDelegator {
  BasePoductPriceDelegator(this.product);

  AbstractProdductModel product;

  ///[unitPrice]商品单价
  double get unitPrice => product?.price;

  ///总价
  double get totalPrice => 0;

  String get tag => "${product?.id}";
}

///对于窗帘 还需要商品属性 商品宽高
abstract class BaseCurtainProuctPriceDelegator
    extends BasePoductPriceDelegator {
  BaseCurtainProuctPriceDelegator(AbstractProdductModel product)
      : super(product);

  ///[foldingFactor]褶皱系数:至于什么是褶皱系数 我也不知道
  double foldingFactor = 2.0;

  double get widthM => product.widthM;

  double get heightM => product.heightM;

  double get heightCM => product.heightCM;

  double get maxHeightM {
    if (product.isCustomSize) {
      return 2.7;
    }
    return 2.76;
  }

  double get area {
    double _area = widthM * heightM;
    return _area > 0
        ? _area < 1
            ? 1
            : _area
        : 0;
  }

  ///窗纱的价格
  double get gauzePrice => product.gauzePrice;

  ///配饰的价格
  double get accessoryPrice => product.accessoryPrice;

  ///型材的价格
  double get sectionalBarPrice => product.sectionalBarPrice;

  ///里布的价格
  double get ribouxPrice => product.ribouxPrice;

  ///幔头的价格
  double get valancePrice => product.valancePrice;

  bool get hasGauze => product.hasGauze;
}

///布艺帘价格计算
class FabricCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  FabricCurtainProductPriceDelegator(AbstractProdductModel product)
      : super(product);

  @override
  double get totalPrice {
    double tmp = unitPrice;

    ///如果有窗纱
    if (hasGauze) {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalBarPrice * widthM * foldingFactor +
          accessoryPrice;
    }

    ///没有窗纱
    else {
      tmp = mainCurtainClothPrice +
          (ribouxPrice + gauzePrice) * foldingFactor * widthM * heightFactor +
          valancePrice * widthM +
          sectionalBarPrice * widthM +
          accessoryPrice;
    }

    return tmp;
  }

//窗帘主布高度因子
  double get mainHeightFactor {
    double factor = 1.0;
    if (CommonKit.isNullOrZero(heightCM)) return factor;
    if (heightM > maxHeightM && product.isCustomSize) {
      factor = (widthM + heightM - 2.65) / widthM;
    }
    return factor;
  }

  // 窗帘高度因子2
  double get heightFactor {
    if (CommonKit.isNullOrZero(heightCM)) return 1.0;
    return heightM > maxHeightM ? 1.5 : 1.0;
  }

  ///[mainCurtainClothPrice]窗帘主布价格
  double get mainCurtainClothPrice {
    ///窗帘定高计算
    if (product?.isFixedHeight == true) {
      return widthM * foldingFactor * heightFactor * unitPrice;
    }

    ///窗帘定宽计算
    if (product?.isFixedWidth == true) {
      ///如果窗帘定宽且拼花
      if (product?.hasFlower == true) {
        return unitPrice *
            ((widthM * foldingFactor / product?.doorWidth).ceil() *
                ((heightM + 0.2) / product?.flowerSize).ceil() *
                product?.flowerSize);
      }

      ///如果窗帘定宽但不拼花
      return unitPrice *
          ((widthM * foldingFactor / product?.doorWidth).ceil() *
              ((heightM + 0.2)));
    }

    ///自定义宽高
    return widthM * foldingFactor * mainHeightFactor * unitPrice;
  }
}

class RollingCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  RollingCurtainProductPriceDelegator(AbstractProdductModel product)
      : super(product);

  @override
  double get totalPrice => unitPrice * area;
}

class GauzeCurtainProductPriceDelegator
    extends BaseCurtainProuctPriceDelegator {
  GauzeCurtainProductPriceDelegator(AbstractProdductModel product)
      : super(product);

  @override
  double get totalPrice {
    double tmp = unitPrice;
    double heightFactor = 1.0;

    if (heightM == null) return tmp;
    if (heightM > maxHeightM) {
      heightFactor = 1.5;

      if (!product.isFixedHeight) {
        heightFactor = (widthM + heightM - 2.65) / widthM;
        // mainHeightFactor = (widthM + heightM - 2.7) / widthM;
      }
    }
    tmp = unitPrice * widthM * heightFactor * foldingFactor +
        sectionalBarPrice * widthM +
        accessoryPrice;
    return tmp;
  }
}

class FinishedProductPriceDelegator extends BasePoductPriceDelegator {
  FinishedProductPriceDelegator(AbstractProdductModel product) : super(product);

  @override
  double get unitPrice => (product?.currentSku?.price ?? product?.price ?? 0);

  ///数量
  int get count => product?.count;

  ///总价
  double get totalPrice => unitPrice * count;
}

class SectionalbarProductPriceDelegator extends BasePoductPriceDelegator {
  SectionalbarProductPriceDelegator(AbstractProdductModel product)
      : super(product);

  @override
  double get unitPrice => (product?.currentSku?.price ?? product?.price ?? 0);

  ///数量
  int get count => product?.count;

  ///总价
  double get totalPrice => (unitPrice * product.widthM);
}
