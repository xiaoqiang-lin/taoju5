/*
 * @Description:搜索顶部
 * @Author: iamsmiling
 * @Date: 2021-05-24 16:15:07
 * @LastEditTime: 2021-07-28 14:38:04
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/search/dialog/remove_search_history_dialog.dart';

class SearchHeader extends StatefulWidget {
  final List<String> history;
  final Function(String) onRemove;
  final Function()? onEmpty;
  final Function(String) onSearch;
  final int maxCount;
  const SearchHeader({
    Key? key,
    required this.history,
    required this.onRemove,
    this.onEmpty,
    required this.onSearch,
    this.maxCount = 5,
  }) : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late Completer completer;
  bool expanded = false;
  Future expand() {
    if (expanded) {
      completer.complete();
      expanded = false;
    } else {
      completer = Completer();
      expanded = true;
    }
    setState(() {});
    return completer.future;
  }

  List<String> get list {
    if (widget.history.length < widget.maxCount || expanded) {
      return widget.history;
    }
    return widget.history.sublist(0, widget.maxCount);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.history.isNotEmpty,
      child: Container(
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
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () => openClearSearchHistoryDialog(
                          context,
                          onEmpty: widget.onEmpty,
                        ),
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
                  for (String v in list)
                    GestureDetector(
                      onTap: () => widget.onSearch(v),
                      onLongPress: () {
                        openRemoveSearchHistoryDialog(context,
                                onRemove: widget.onRemove, value: v)
                            .whenComplete(() => null);
                      },
                      child: Container(
                        child: Text(
                          v,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: R.dimen.sp12,
                            color: R.color.ff666666,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: R.dimen.dp20, vertical: R.dimen.dp7),
                        decoration: BoxDecoration(
                            color: R.color.fff5f5f5,
                            borderRadius: BorderRadius.circular(R.dimen.sp4)),
                      ),
                    ),
                  Visibility(
                    visible: widget.history.length > widget.maxCount,
                    child: Container(
                      height: R.dimen.dp30,
                      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                      decoration: BoxDecoration(
                          color: R.color.fff5f5f5,
                          borderRadius: BorderRadius.circular(R.dimen.sp4)),
                      child: RotateButton(onPressed: expand),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
