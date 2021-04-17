import 'dart:convert';

import 'package:taoju5_b/domain/model/product/abstract_product_model.dart';
import 'package:taoju5_b/domain/model/product/product_detail_model.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';
import 'package:taoju5_b/domain/model/product/product_type.dart';
import 'package:taoju5_b/domain/model/window/window_style_model.dart';
import 'package:taoju5_b/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_pridce_delegator.dart';
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:get/get.dart';

import 'product_adapter_model.dart';
import 'package:taoju5_b/domain/model/product/curtain_product_attr_model.dart';

class ProductMixinModel implements AbstractProdductModel {
  int id;
  String name;
  String image;
  double marketPrice;
  double price;
  String unit;
  int picId;
  int code;
  int tagId;

  String get widthMStr => ((width ?? 0) / 100)?.toStringAsFixed(2);
  String get heightMStr => ((height ?? 0) / 100)?.toStringAsFixed(2);

  double get widthM => (width ?? 0) / 100;
  double get heightM => (height ?? 0) / 100;
  double get heightCM => height;
  double width;
  double height;

  List<CurtainProductAttrAdapterModel> attrList = [];

  String room;
  String roomId;

  String material;

  ///离地距离
  String deltaY;

  Map installData;
  // double totalPrice;

  List<ProductSpecModel> specList;
  List<ProductSkuModel> skuList;
  String thumbnail;

  String measureId;

  String _attribute;

  String skuId;
  String skuName;

  Map measureData;
  String installInfo;
  WindowStyleOptionModel style;

  String windowPattern;

  double defaultWidth = 3.5;
  double defaultHeight = 2.65;

  ProductMixinModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    thumbnail = json['pic_cover_small'] ?? "";
    image = (json['pic_cover_mid'] ?? json['image'] ?? json['picture']);
    code = json["goods_type"];
    marketPrice = JsonKit.asDouble(json['market_price']);
    // totalPrice = JsonKit.asDouble(json['total_price']);
    tagId = json["tag_id"];
    price = JsonKit.asDouble(json["price"]);
    unit = json["unit"];
    picId = json["pic_id"];
    price = JsonKit.asDouble(
        (json['price'] ?? json['display_price'] ?? json['market_price']));
    width = JsonKit.asDouble(json['width']);
    height = JsonKit.asDouble(json['height']);
    defaultWidth = width;
    defaultHeight = height;
    Map<String, dynamic> sku = json['sku_list']?.first ?? {};

    skuName = json['sku_name'] ?? sku['sku_name'];
    // defalutSkuId = sku['sku_id'];
    skuId = "${json["sku_id"] ?? sku["sku_id"]}";
    skuName = json["sku_name"];
    specList = JsonKit.asList(json["spec_list"])
        .map((e) => ProductSpecModel.fromJson(e))
        .toList();
    skuList = JsonKit.asList(json["sku_list"])
        .map((e) => ProductSkuModel.fromJson(e))
        .toList();
    material = json["material"];

    isFixedHeight = json['fixed_height'] == 1;
    isFixedWidth = json['fixed_height'] == 2;
    isCustomSize = json['fixed_height'] == 3;

    ///后台数据以cm为单位,在这里进行单位转换
    doorWidth = (JsonKit.asDouble(json['larghezza_size']) / 100);
    flowerSize = (JsonKit.asDouble(json['flower_distance']) / 100);

    TaojuwuController taojuwuController = Get.find<TaojuwuController>();
    attrList = [
      taojuwuController.gauze.attrAdapt(),
      taojuwuController.craft.attrAdapt(),
      taojuwuController.accessory.attrAdapt(),
      taojuwuController.valance.attrAdapt(),
      taojuwuController.riboux.attrAdapt(),
      taojuwuController.sectionalbar.attrAdapt(),
    ];
    room = taojuwuController.room.currentOptionName;
    roomId = taojuwuController.room.currentOptionId;
    width = defaultWidth;
    height = defaultHeight;

    measureData = {
      "width": width ?? defaultWidth,
      "height": height ?? defaultHeight,
      "vertical_ground_height": deltaY,
      "goods_id": id,
      "install_room": roomId,
    };
  }

  set attribute(String val) {
    _attribute = val;
  }

  String get attribute {
    if (_attribute != null) return _attribute;
    Map map = {};
    attrList?.forEach((e) {
      map.addAll(e.params);
    });
    map.addAll({
      '9': [
        {'name': '宽', 'value': width},
        {'name': '高', 'value': height}
      ]
    });
    return jsonEncode(map);
  }

  @override
  int count = 1;
  double get gauzePrice {
    if (productType is FinishedProductType) return 0;

    return _getAttrItemPrice(3);
  }

  double get accessoryPrice {
    if (productType is FinishedProductType) return 0;
    return _getAttrItemPrice(13);
  }

  double get sectionalBarPrice {
    if (productType is FinishedProductType) return 0;
    return _getAttrItemPrice(5);
  }

  double get ribouxPrice {
    if (productType is FinishedProductType) return 0;
    return _getAttrItemPrice(12);
  }

  double get valancePrice {
    if (productType is FinishedProductType) return 0;
    return _getAttrItemPrice(8);
  }

  bool get hasGauze {
    if (GetUtils.isNullOrBlank(attrList)) return false;
    int index = attrList.indexWhere((e) => e.type == "1");
    if (index == -1) return false;
    return RegExp("不要").hasMatch(attrList[index].key);
  }

  @override
  double doorWidth;

  @override
  double flowerSize;

  @override
  bool hasFlower;

  @override
  bool isCustomSize;

  @override
  bool isFixedHeight;

  @override
  bool isFixedWidth;

  @override
  ProductSkuModel get currentSku => null;
}

extension ProductMixinModelKit on ProductMixinModel {
  BaseProductType get productType => getProductType(code);

  Map get defaultParams {
    return {};
  }

  BasePoductPriceDelegator get priceDelegator {
    if (productType is FabricCurtainProductType) {
      return FabricCurtainProductPriceDelegator(this);
    }
    if (productType is RollingCurtainProductType) {
      return RollingCurtainProductPriceDelegator(this);
    }
    if (productType is GauzeCurtainProductType) {
      return GauzeCurtainProductPriceDelegator(this);
    }
    if (productType is SectionalbarProductType) {
      return SectionalbarProductPriceDelegator(this);
    }

    if (productType is FinishedProductType) {
      return FinishedProductPriceDelegator(this);
    }
    return null;
  }

  double get totalPrice => priceDelegator?.totalPrice ?? 0;

  bool get isUseDefaultMeasureData =>
      widthM == defaultWidth && heightM == defaultHeight;

  String get currentSkuDescription {
    if (GetUtils.isNullOrBlank(specList)) return "";
    List<String> list = [];
    specList?.forEach((e) {
      e?.optionList?.forEach((o) {
        if (o.isChecked) {
          list.add(o?.name);
        }
      });
    });
    return list?.join(" ");
  }

  ProductSkuModel get currentSkuModel {
    if (GetUtils.isNullOrBlank(skuList)) return null;
    return skuList?.firstWhere((e) => e?.name?.contains(currentSkuDescription));
  }

  String get description {
    if (productType is FinishedProductType) {
      return "${currentSkuModel?.name ?? currentSkuDescription}\n数量x1";
    }

    if (productType is SectionalbarProductType) {
      return "${currentSkuModel?.name ?? currentSkuDescription}\n用料:$width米";
    }
    return "宽:$widthM米 高:$heightM米,$room,离地距离(cm):${deltaY ?? ''},${installInfo ?? ''}";
  }

  Map get params => {
        "cart_tag": "app",
        "estimated_price": totalPrice,
        "wc_attr": attribute ?? "",
        "measure_data":
            productType is CurtainProductType ? measureData ?? "" : "0",
        "cart_detail": jsonEncode({
          "goods_name": name,
          "sku_id": "${currentSkuModel?.id ?? skuId}",
          "price": price,
          "num": "${currentSkuModel?.count ?? 1}",
          "sku_name": "${currentSkuModel?.name ?? skuName}",
          "goods_id": id,
          "picture": picId,
          "material": material
        })
      };

  Map toJson() => {
        "id": id,
        "name": name,
        "room": room,
        "price": price,
        "description": description,
        "attr_list": attrList.map((e) => e.adapt()).toList(),
        "image": image,
        "total_price": totalPrice,
        "measure_id": measureId,
        "sku_id": skuId,
        "attribute": attribute,
        "type": code
      };
  ProductAdapterModel adapt() {
    return ProductAdapterModel.fromJson(toJson());
  }

  double _getAttrItemPrice(int type) {
    if (GetUtils.isNullOrBlank(attrList)) return 0;
    for (int i = 0; i < attrList.length; i++) {
      CurtainProductAttrAdapterModel item = attrList[i];

      if (item.type == "$type") {
        return item.price;
      }
    }
    return 0;
  }
}
