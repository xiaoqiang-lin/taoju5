/*
 * @Description: 商品搜索
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:50:59
 * @LastEditTime: 2021-05-24 17:15:38
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:get/get.dart';

class SearchController extends BaseFutureLoadStateController {
  List<String> history = ["窗纱", "白色窗帘", "白色窗帘", "窗纱", "北欧风窗帘", "黑窗纱"];

  String keyword = '';

  List<String> keyList = [
    "BML10002",
    "BML10031",
    "1002BML",
    "1009NMK",
    "10009LKD"
  ];

  bool focused = false;
  @override
  Future loadData({Map? params}) {
    return Future.value([]);
  }

  focus() {
    focused = true;
    update();
  }

  unfocus() {
    focused = false;
    update();
  }

  List<List<String>> get keyOptions {
    if (GetUtils.isNullOrBlank(keyList) ?? true) {
      return [];
    }
    List<List<String>> list = [];
    keyList.where((e) => e.isCaseInsensitiveContainsAny(keyword)).forEach((e) {
      int startIndex = e.indexOf(RegExp("$keyword", caseSensitive: false));
      print(startIndex);
      if (startIndex != -1) {
        List<String> arr = [];
        arr.add(e.substring(0, startIndex));
        arr.add(e.substring(startIndex, startIndex + keyword.length));
        arr.add(e.substring(startIndex + keyword.length));
        list.add(arr);
      }
    });
    return list;
  }

  void onChanged(String val) {
    CommonKit.debounce(() {
      keyword = val;

      update(["keyword"]);
    }, Duration(milliseconds: 375))();
  }
}
