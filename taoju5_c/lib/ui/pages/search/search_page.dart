/*
 * @Description: 搜索窗帘
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:02:50
 * @LastEditTime: 2021-05-24 17:08:14
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/search/search_controller.dart';
import 'package:taoju5_c/ui/pages/search/section/hot_search_search_section.dart';
import 'package:taoju5_c/ui/pages/search/section/section_header.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.history);
    return GetBuilder<SearchController>(builder: (_) {
      return GestureDetector(
        onTap: _.unfocus,
        child: Scaffold(
            appBar: AppBar(
              // title: Container(
              //   width: double.maxFinite,
              //   constraints:
              //       BoxConstraints(maxHeight: R.dimen.dp30, minHeight: R.dimen.dp30),
              //   padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(R.dimen.sp30),
              //       color: R.color.fff5f5f5),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         border: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         isCollapsed: true,
              //         hintText: "搜索您想找的内容",
              //         hintStyle:
              //             TextStyle(fontSize: R.dimen.sp10, color: R.color.ffb4b4b4)),
              //   ),
              // ),
              title: IndexedStack(
                index: !_.focused ? 0 : 1,
                children: [
                  GestureDetector(
                    onTap: _.focus,
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(R.image.search, color: R.color.ffb4b4b4),
                          Container(
                            margin: EdgeInsets.only(left: R.dimen.dp3),
                            child: Text(
                              "搜索您想找的内容",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: R.dimen.sp10,
                                  color: R.color.ffb4b4b4),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(R.dimen.sp30),
                          color: R.color.fff5f5f5),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    constraints: BoxConstraints(
                        maxHeight: R.dimen.dp30, minHeight: R.dimen.dp30),
                    padding: EdgeInsets.symmetric(
                        vertical: R.dimen.dp8, horizontal: R.dimen.dp10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(R.dimen.sp30),
                        color: R.color.fff5f5f5),
                    child: TextField(
                      onChanged: _.onChanged,
                      style: TextStyle(fontSize: R.dimen.sp12),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isCollapsed: true),
                    ),
                  ),
                ],
              ),
              actions: [
                Container(
                  margin:
                      EdgeInsets.only(left: R.dimen.dp10, right: R.dimen.dp20),
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                      maxHeight: R.dimen.dp30, minHeight: R.dimen.dp30),
                  child: PrimaryButton(
                    onPressed: () {},
                    text: "搜索",
                    size: PrimaryButtonSize.small,
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: !_.focused ? 0 : 1,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: SearchHeader(history: controller.history)),
                    SliverToBoxAdapter(
                        child: HotSearchSection(hotWords: controller.history))
                  ],
                ),
                GetBuilder<SearchController>(
                    id: "keyword",
                    builder: (_) {
                      return ListView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: R.dimen.dp30),
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: R.dimen.dp16),
                                    child: Row(
                                      children: [
                                        for (String e in _.keyOptions[i])
                                          Text(
                                            e,
                                            style: TextStyle(
                                                color: !(GetUtils.isNullOrBlank(
                                                                _.keyword) ??
                                                            true) &&
                                                        RegExp("${_.keyword}",
                                                                caseSensitive:
                                                                    false)
                                                            .hasMatch(e)
                                                    ? R.color.ffee9b5f
                                                    : R.color.ff333333),
                                          )
                                      ],
                                    )),
                                Divider()
                              ],
                            );
                          },
                          itemCount: _.keyList.length);
                    })
              ],
            )),
      );
    });
  }
}
