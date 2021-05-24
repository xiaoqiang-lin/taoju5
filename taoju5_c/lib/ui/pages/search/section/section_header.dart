/*
 * @Description:搜索顶部
 * @Author: iamsmiling
 * @Date: 2021-05-24 16:15:07
 * @LastEditTime: 2021-05-24 17:50:33
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/search/dialog/remove_search_history_dialog.dart';

class SearchHeader extends StatelessWidget {
  final List<String> history;
  const SearchHeader({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: R.dimen.dp24, horizontal: R.dimen.dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "历史搜索",
                style: TextStyle(
                    fontSize: R.dimen.sp14,
                    color: R.color.ff333333,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  onTap: () =>
                      openClearSearchHistoryDialog(context, history: history),
                  child: Text(
                    "清除记录",
                    style: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp15),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: R.dimen.dp10,
              runSpacing: R.dimen.dp12,
              children: [
                for (String v in history)
                  GestureDetector(
                    onTap: () {},
                    onLongPress: () {
                      openRemoveSearchHistoryDialog(context,
                              history: history, value: v)
                          .whenComplete(() => null);
                    },
                    child: Container(
                      height: R.dimen.dp30,
                      child: Text(
                        v,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: R.dimen.sp12,
                            color: R.color.ff666666,
                            height: 2.1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: R.dimen.dp20,
                      ),
                      decoration: BoxDecoration(
                          color: R.color.fff5f5f5,
                          borderRadius: BorderRadius.circular(R.dimen.sp4)),
                    ),
                  ),
                Container(
                  height: R.dimen.dp30,
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                  decoration: BoxDecoration(
                      color: R.color.fff5f5f5,
                      borderRadius: BorderRadius.circular(R.dimen.sp4)),
                  child: RotateButton(
                      onPressed: () => Future.delayed(Duration(seconds: 1))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
