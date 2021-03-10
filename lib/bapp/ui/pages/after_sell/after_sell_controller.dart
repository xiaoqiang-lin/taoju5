import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:taoju5/bapp/domain/model/upload/upload_image_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_styles.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum ServerType {
  order, //订单错误
  money, //结算金额出错
  product, //产品残次问题
  install //安装出错
}

class ServerContentParamsModel {
  ServerType type;
  String description;
  String images;
  String orderId;

  int get code {
    Map<ServerType, int> map = {
      ServerType.order: 1,
      ServerType.money: 2,
      ServerType.product: 3,
      ServerType.install: 4,
      null: 0
    };
    return map[type];
  }

  Map get params => {
        "picture": images,
        "order_id": orderId,
        "type": code,
        "description": description
      };

  ServerContentParamsModel(
      {@required this.orderId, this.description, this.type, this.images});
}

class AfterSellController extends GetxController {
  ServerType serverType = ServerType.order;

  Map<ServerType, String> dict = {
    ServerType.order: "产品下错订单",
    ServerType.money: "结算金额出错",
    ServerType.product: "产品残次问题",
    ServerType.install: "安装出错"
  };

  String description;

  ///从相册中选择的图片列表
  List<Asset> uploadImageList = [];

  ///已上传的图片列表
  List<String> imageList = [];

  ///单张图片上传
  Future _singleImageUpload(Asset asset) async {
    ByteData byteData = await asset.getByteData();
    List<int> buffer = byteData.buffer.asInt8List();
    String suffix = _getSuffix(asset);
    dio.MultipartFile file = dio.MultipartFile.fromBytes(buffer,
        filename: asset.name, contentType: MediaType("image", suffix));
    dio.FormData formData = dio.FormData.fromMap({"file_path": file});
    TaojuwuRepository repository = TaojuwuRepository();
    return repository.uploadImage({"file_path": asset.name}, formData).then(
        (UploadImageModel model) {
      imageList.add(model.img);
      update(["image"]);
    });
  }

  ///上传图片
  _upload() => uploadImageList.forEach(_singleImageUpload);

  ///选择图片
  selectImage() async {
    try {
      uploadImageList = await MultiImagePicker.pickImages(
          maxImages: 9,
          enableCamera: true,
          materialOptions: MaterialOptions(
              allViewTitle: "所有照片", textOnNothingSelected: "暂未选中照片"));
      Get.back();
      _upload();
    } catch (err) {
      EasyLoading.showError("上传图片出错");
    }
  }

  ///删除图片
  void remove(String src) {
    imageList.remove(src);
    update(["image"]);
  }

  ///显示选择图片modal
  Future showSelectImageModal() {
    return showModalBottomSheet(
        context: Get.context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text(
              "选择图片",
              style: BStyles.dialogTitle,
            ),
            actions: [
              CupertinoActionSheetAction(
                  isDefaultAction: true,
                  onPressed: selectImage,
                  child: Text(
                    "从相册中选择图片",
                    style: TextStyle(color: BColors.textColor),
                  )),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                "取消",
                style: TextStyle(color: BColors.textColor),
              ),
              onPressed: Get.back,
            ),
          );
        });
  }

  ///获取文件后缀名
  String _getSuffix(Asset asset) {
    int index = asset.name.lastIndexOf(".");
    return asset.name.substring(index + 1);
  }

  Future submit() {
    ServerContentParamsModel model = ServerContentParamsModel(
        orderId: Get.parameters["id"],
        type: serverType,
        description: description,
        images: imageList.join(","));

    OrderRepository repository = OrderRepository();
    return repository.aftersell(params: model.params);
  }
}
