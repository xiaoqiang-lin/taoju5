/*
 * @Description: 在搜索页面进行输入时的页面
 * @Author: iamsmiling
 * @Date: 2021-07-28 10:36:39
 * @LastEditTime: 2021-07-28 14:02:42
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_controller.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_fragment.dart';
import 'package:get/get.dart';

class SearchInputPage extends StatelessWidget {
  const SearchInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchKeywordController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.maxFinite,
            constraints: BoxConstraints(
                maxHeight: R.dimen.dp30, minHeight: R.dimen.dp30),
            padding: EdgeInsets.symmetric(
                vertical: R.dimen.dp8, horizontal: R.dimen.dp10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(R.dimen.sp30),
                color: R.color.fff5f5f5),
            child: TextFormField(
              onChanged: _.onChanged,
              // onSubmitted: _.onSubmitted,
              initialValue: _.keyword,
              style: TextStyle(fontSize: R.dimen.sp12),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isCollapsed: true),
            ),
          ),
        ),
        body: SearchKeyWordFragment(
          onKeywordTap: (String s) => Get.back<String>(result: s),
        ),
      );
    });
  }
}
