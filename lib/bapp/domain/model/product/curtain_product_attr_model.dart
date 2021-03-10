/*
 * @Description: 窗帘商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 10:20:26
 * @LastEditTime: 2021-01-19 11:34:02
 */
import 'package:taoju5/bapp/domain/model/product/product_adapter_model.dart';
import 'package:taoju5/bapp/interface/i_xselectable.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:get/utils.dart';

const Map _dict = {
  1: '空间',
  2: '窗型',
  3: '窗纱',
  4: '工艺',
  5: '型材',
  6: '帘身款式',
  7: '帘身面料',
  8: '幔头',
  9: '尺寸',
  12: '里布',
  13: '配饰',

  ///自定义属性
  -5: "样式",
  -4: "窗型",
  -3: "有盒",
  -2: "打开方式",
  -1: "安装选项"
};

class CurtainProductAttrModel {
  int type;
  String typeName;
  bool isMultiple;
  List<CurtainProductAttrOptionModel> optionList;

  CurtainProductAttrModel.fromType(this.type, Map json,
      {this.isMultiple = false}) {
    optionList = JsonKit.asList(json["$type"])
        .map((e) => CurtainProductAttrOptionModel.fromJson(e))
        ?.toList();

    typeName = _dict[type];
  }

  Map toArgs() {
    return {"list": optionList.map((e) => e.toJson()).toList()};
  }

  CurtainProductAttrModel();
  CurtainProductAttrModel copy() {
    CurtainProductAttrModel e = CurtainProductAttrModel();
    e.type = type;
    e.typeName = typeName;
    e.isMultiple = isMultiple;
    e.optionList = optionList
        .map((e) => e.copy())
        .cast<CurtainProductAttrOptionModel>()
        .toList();
    return e;
  }

  // ///当前选中的[option]
  // List<CurtainProductAttrOptionModel> get currentSelectedOptionList =>
  //     optionList.where((e) => e.isChecked).toList();

  // String get currentOptionName =>
  //     currentSelectedOptionList.map((e) => e.name).join("/");

  // double get currentOptionPrice => isMultiple
  //     ? currentSelectedOptionList?.map((e) => e.price)?.reduce((a, b) => a + b)
  //     : currentSelectedOptionList?.first?.price;

  // Map toJson() => {type: currentSelectedOptionList.map((e) => e.toJson())};
}

extension CurtainProductAttrModelKit on CurtainProductAttrModel {
  ///当前选中的[option]
  List<CurtainProductAttrOptionModel> get currentSelectedOptionList =>
      optionList.where((e) => e.isChecked).toList();

  String get currentOptionName =>
      currentSelectedOptionList.map((e) => e.name).join("/");

  double get currentOptionPrice => isMultiple
      ? currentSelectedOptionList?.map((e) => e.price)?.reduce((a, b) => a + b)
      : currentSelectedOptionList?.first?.price;

  Map toArgs() => {type: currentSelectedOptionList.map((e) => e.toJson())};

  List<CurtainProductAttrOptionModel> get confirmSelectedOptionList =>
      optionList.where((e) => e.isChecked && e.hasConfirmed).toList();

  Map toJson() => {
        "type": type,
        "attr_category": typeName,
        "attr_name": currentOptionName,
        "sub_total": currentOptionPrice
      };
  ProductAdapterModel adapt() {
    ProductAdapterModel model = ProductAdapterModel();
    // model.id = id;
    return model;
  }

  Map get params =>
      {
        "$type": GetUtils.isNullOrBlank(confirmSelectedOptionList)
            ? []
            : isMultiple
                ? confirmSelectedOptionList?.map((e) => e.toJson())?.toList()
                : confirmSelectedOptionList?.first?.toJson()
      } ??
      {};
}

///[Curtai['
///
///
///dop0we']) => e.isChecked).toList();

//   String get currentOptionName =>
//       currentSelectedOptionList.map((e) => e.name).join("/");

//   double get curretnOptionPrice => isMultiple
//       ? currentSelectedOptionList?.map((e) => e.price)?.reduce((a, b) => a + b)
//       : currentSelectedOptionList?.first?.price;

//   Map toJson() => {type: currentSelectedOptionList.map((e) => e.toJson())};
// }

class CurtainProductAttrOptionModel implements IXSelectable {
  int id;
  String picture;
  String name;
  String tag;
  int tagId;
  double price;
  int type;
  String typeName;
  String assetImage;
  bool hasConfirmed;
  CurtainProductAttrOptionModel();
  CurtainProductAttrOptionModel.fromJson(Map json) {
    id = json["id"];
    picture = JsonKit.asWebUrl(json["picture"]);
    assetImage = json["picture"];
    name = json["k"];
    tag = json["v"];
    tagId = json["tag_id"];
    price = JsonKit.asDouble(json["price"]);
    type = json["type"];
    typeName = _dict[json[type]];
    hasConfirmed = false;
  }

  CurtainProductAttrOptionModel copy() {
    CurtainProductAttrOptionModel e = CurtainProductAttrOptionModel();
    e.id = id;
    e.picture = picture;
    e.assetImage = assetImage;
    e.name = name;
    e.tag = tag;
    e.tagId = tagId;
    e.price = price;
    e.type = type;
    e.typeName = typeName;
    e.hasConfirmed = hasConfirmed;
    return e;
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "k": name,
        "v": tag,
        "price": price,
        "type": type
      };

  @override
  bool isChecked = false;
}

extension CurtainProductAttrOptionModelKit on CurtainProductAttrOptionModel {
  ///是否含有轨道
  bool get hasTrack => RegExp("GD", caseSensitive: false).hasMatch(name);

  ///是否为龙马杆
  bool get isDragonHorsePole =>
      RegExp("LMG", caseSensitive: false).hasMatch(name);

  ///是否为单龙马杆
  bool get isSinglePole => RegExp("单").hasMatch(name);

  ///是否打孔
  bool get hasHole => RegExp("孔").hasMatch(name);

  ///是否需要窗纱
  bool get hasGauze => !RegExp("不").hasMatch(name);
}

class CurtainModeAttrModelListWrapper {
  List<CurtainModeAttrModel> list;

  CurtainModeAttrModelListWrapper.fromJson(Map json) {
    list = json["-1"]
        .map((e) => CurtainModeAttrModel.fromJson(e))
        .cast<CurtainModeAttrModel>()
        .toList();
  }

  Map toJson() => {"-1": list.map((e) => e.toJson()).toList()};
}

class CurtainModeAttrModel {
  String name;
  int id;
  List<CurtainInstallModeOptionModel> installModeOptionList;

  List<CurtainOpenModeModel> openModeOptionList;

  CurtainModeAttrModel.fromJson(Map json) {
    name = json["name"];
    id = json["id"];
    installModeOptionList = json["install_modes"]
        .map((e) => CurtainInstallModeOptionModel.fromJson(e))
        .toList()
        .cast<CurtainInstallModeOptionModel>();
    openModeOptionList = json["open_modes"]
        .map((e) => CurtainOpenModeModel.fromJson(e))
        .cast<CurtainOpenModeModel>()
        .toList();
  }

  Map toJson() => {
        "name": name,
        "id": id,
        "install_modes": installModeOptionList.map((e) => e.toJson()).toList(),
        "open_modes": openModeOptionList.map((e) => e.toJson()).toList()
      };
}

class CurtainInstallModeOptionModel implements IXSelectable {
  String name;
  String img;
  bool isChecked;

  CurtainInstallModeOptionModel.fromJson(Map json) {
    name = json["name"];
    img = json["img"];
    isChecked = json["is_checked"];
  }

  Map toJson() => {"name": name, "img": img, "is_checked": isChecked};
}

class CurtainOpenModeModel implements IXSelectable {
  String name;

  bool isChecked;
  int index;
  List<CurtainSubOpenModeModel> optionList;
  CurtainOpenModeModel.fromJson(Map json) {
    name = json["name"];
    isChecked = json["is_checked"];
    index = json["index"];
    optionList = json["sub_options"]
        .map((e) => CurtainSubOpenModeModel.fromJson(e))
        .cast<CurtainSubOpenModeModel>()
        .toList();
  }

  Map toJson() => {
        "name": name,
        "is_checked": isChecked,
        "index": index,
        "sub_options": optionList.map((e) => e.toJson()).toList()
      };
}

class CurtainSubOpenModeModel {
  String title;

  List<CurtainSubOpenModeOptionModel> optionList;

  CurtainSubOpenModeModel.fromJson(Map json) {
    title = json["title"];
    optionList = json["options"]
        .map((e) => CurtainSubOpenModeOptionModel.fromJson(e))
        .cast<CurtainSubOpenModeOptionModel>()
        .toList();
  }
  Map toJson() =>
      {"title": title, "options": optionList.map((e) => e.toJson()).toList()};
}

class CurtainSubOpenModeOptionModel implements IXSelectable {
  String name;
  bool isChecked;
  CurtainSubOpenModeOptionModel.fromJson(Map json) {
    name = json["name"];
    isChecked = json["is_checked"];
  }

  Map toJson() => {"name": name, "is_checked": isChecked};
}
