/*
 * @Description: 搜索窗帘
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:02:50
 * @LastEditTime: 2021-07-28 14:37:42
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/search/search_controller.dart';
import 'package:taoju5_c/ui/pages/search/search_keyword_fragment/search_keyword_fragment.dart';
import 'package:taoju5_c/ui/pages/search/section/hot_search_search_section.dart';
import 'package:taoju5_c/ui/pages/search/section/section_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        autoRemove: true,
        builder: (_) {
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
                              Image.asset(R.image.search,
                                  color: R.color.ffb4b4b4),
                              Container(
                                margin: EdgeInsets.only(left: R.dimen.dp3),
                                child: Text(
                                  "${_.searchTip}",
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
                          onSubmitted: _.onSubmitted,
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
                      margin: EdgeInsets.only(
                          left: R.dimen.dp10, right: R.dimen.dp20),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                          maxWidth: R.dimen.dp60,
                          maxHeight: R.dimen.dp30,
                          minHeight: R.dimen.dp30),
                      child: PrimaryButton(
                        onPressed: _.search,
                        text: "搜索",
                        textStyle: TextStyle(fontSize: R.dimen.sp32),
                        size: PrimaryButtonSize.small,
                      ),
                    ),
                  ],
                ),
                body: FutureLoadStateBuilder<SearchController>(
                    controller: _,
                    loadingBuilder: (_) => SizedBox.shrink(),
                    builder: (_) {
                      return IndexedStack(
                        index: !_.focused ? 0 : 1,
                        children: [
                          SmartRefresher(
                            controller: _.refreshController,
                            enablePullDown: true,
                            enablePullUp: true,
                            onRefresh: _.refreshData,
                            onLoading: _.loadMore,
                            child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: SearchHeader(
                                    history: _.historyList,
                                    onRemove: _.onRemove,
                                    onEmpty: _.onEmpty,
                                    onSearch: _.search,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                    child: HotSearchSection(
                                        onKeyWordTap: _.search,
                                        hotWords: _.hotKeywords)),
                                SliverToBoxAdapter(
                                  child: CommendationFragment(
                                    scrollController: _.scrollController,
                                    tag: "${_.type}",
                                    header: Container(
                                      margin: EdgeInsets.only(
                                          left: R.dimen.dp24,
                                          top: R.dimen.dp24,
                                          bottom: R.dimen.dp15),
                                      child: Text(
                                        "精选推荐",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: R.dimen.sp15,
                                            color: R.color.ff333333),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SearchKeyWordFragment(onKeywordTap: _.search)
                        ],
                      );
                    })),
          );
        });
  }
}
