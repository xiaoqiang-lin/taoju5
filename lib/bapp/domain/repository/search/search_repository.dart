/*
 * @Description搜索
 * @Author: iamsmiling
 * @Date: 2021-02-02 11:00:49
 * @LastEditTime: 2021-02-02 11:25:46
 */
import 'package:taoju5/bapp/domain/model/search/search_model.dart';
import 'package:taoju5/bapp/domain/provider/search/search_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class SearchRepository {
  SearchAPI _api = SearchAPI();

  Future<SearchModel> search({Map params}) {
    return _api
        .search("/api/goods/searchContent")
        .then((BaseResponse response) {
      if (response.isValid) {
        return SearchModel.fromJson(response.data);
      }

      throw response.message;
    });
  }
}
