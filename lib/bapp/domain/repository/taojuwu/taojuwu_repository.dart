/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:32:13
 * @LastEditTime: 2020-12-21 16:51:21
 */
import 'package:taoju5/bapp/domain/model/upload/upload_image_model.dart';
import 'package:taoju5/bapp/domain/provider/taojuwu/taojuwu_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class TaojuwuRepository {
  TaojuwuAPI _api = TaojuwuAPI();

  Future<BaseResponse> curtainProductAttrs() {
    return _api.curtainProductAttrs("/api/goods/wcAttr");
  }

  Future<UploadImageModel> uploadImage(Map params, var formData) {
    return _api
        .uploadImage("/api/upload/uploadImage",
            params: params, formData: formData)
        .then((BaseResponse response) {
      if (response.isValid) {
        return UploadImageModel.fromJson(response.data);
      }
      throw Future.error(response.message);
    });
  }

  Future<BaseResponse> feedback(Map params) {
    return _api.feedback("/api/goods/addGoodsConsult", params: params);
  }
}
