/*
 * @Description: 搜索词
 * @Author: iamsmiling
 * @Date: 2021-07-28 10:42:06
 * @LastEditTime: 2021-07-28 14:01:49
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_controller.dart';

class SearchKeyWordFragment extends StatelessWidget {
  final Function(String) onKeywordTap;
  const SearchKeyWordFragment({Key? key, required this.onKeywordTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchKeywordController>(
      builder: (_) {
        return Visibility(
          visible: _.keyOptions.isNotEmpty,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp30),
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () =>
                      onKeywordTap(_.keyOptions[i].reduce((a, b) => a + b)),
                  // onTap:()=> controller.onItemTap(_.keyOptions),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                          child: Row(
                            children: [
                              for (String e in _.keyOptions[i])
                                Text(
                                  e,
                                  style: TextStyle(
                                      color:
                                          !(GetUtils.isNullOrBlank(_.keyword) ??
                                                      true) &&
                                                  RegExp("${_.keyword}",
                                                          caseSensitive: false)
                                                      .hasMatch(e)
                                              ? R.color.ffee9b5f
                                              : R.color.ff333333),
                                )
                            ],
                          )),
                      Divider()
                    ],
                  ),
                );
              },
              itemCount: _.keyOptions.length),
        );
      },
    );
  }
}
