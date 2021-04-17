/*
 * @Description: 搜索页面
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:23
 * @LastEditTime: 2021-02-02 14:33:35
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:taoju5_b/ui/dialog/search/clear_search_history.dart';
import 'package:taoju5_b/ui/pages/search/search_controller.dart';
import 'package:taoju5_b/ui/pages/search/widget/search_item_tag.dart';
import 'package:taoju5_b/ui/widgets/common/x_search_bar.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BColors.primaryColor,
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: XSearchBar(
          key: ValueKey("searchPage"),
          onSearch: controller.onSearch,
          value: controller?.keyword,
          hintText: controller?.hintText,
          onChanged: controller.onChanged,
          preferredSize: Size.fromHeight(kToolbarHeight),
          onTap: () {
            controller.isHistoryVisible = false;
            controller.update(["container"]);
          },
        ),
        body: GetBuilder<SearchController>(
          id: "container",
          autoRemove: true,
          builder: (_) {
            return PageTransitionSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: _.isHistoryVisible &&
                      !GetUtils.isNullOrBlank(_.historyList)
                  ? GetBuilder<SearchController>(
                      id: "history",
                      builder: (_) {
                        return Visibility(
                          visible: !GetUtils.isNullOrBlank(_.historyList),
                          child: Container(
                            color: BColors.primaryColor,
                            padding:
                                EdgeInsets.symmetric(horizontal: BDimens.gap16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "搜索记录:",
                                      style: TextStyle(
                                          fontSize: BDimens.sp30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(BIcons.del),
                                        onPressed: showClearSearchHistoryDialog)
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    for (String e in _.historyList)
                                      GestureDetector(
                                        onTap: () => Get.back(result: e),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: BDimens.gap16),
                                          child: Chip(
                                              deleteIconColor:
                                                  BColors.greyTextColor,
                                              backgroundColor:
                                                  BColors.scaffoldBgColor,
                                              label: Text(e),
                                              onDeleted: () =>
                                                  _.removeSearchItem(e)),
                                        ),
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : GetBuilder<SearchController>(
                      id: "keyword",
                      builder: (_) {
                        return Visibility(
                          visible: _.keyOptions.length > 0,
                          child: Container(
                            color: Get.theme.primaryColor,
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  for (List<String> option
                                      in _.visibleKeyOptionList)
                                    SearchItemTag(
                                      option: option,
                                      keyword: _.keyword,
                                    ),
                                  Expanded(
                                    child: Visibility(
                                      visible: _.keyOptions.length > 5,
                                      child: SingleChildScrollView(
                                        child: ExpansionTile(
                                          title: Text("查看更多"),
                                          children: [
                                            Column(
                                              children: [
                                                for (List<String> option
                                                    in _.unvisibleKeyOptionList)
                                                  SearchItemTag(
                                                    keyword: _.keyword,
                                                    option: option,
                                                  )
                                              ],
                                            ),
                                            // ListView.separated(
                                            //     shrinkWrap: true,
                                            //     separatorBuilder:
                                            //         (BuildContext context, int i) {
                                            //       return Divider(
                                            //         indent: BDimens.gap24,
                                            //         endIndent: BDimens.gap24,
                                            //       );
                                            //     },
                                            //     itemCount: _.unvisibleKeyList.length,
                                            //     itemBuilder:
                                            //         (BuildContext context, int i) {
                                            //       return Container(
                                            //           margin:
                                            //               EdgeInsets.all(BDimens.gap24),
                                            //           child:
                                            //               Text(_.unvisibleKeyList[i]));
                                            //     }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            );
          },
        ));
  }
}
