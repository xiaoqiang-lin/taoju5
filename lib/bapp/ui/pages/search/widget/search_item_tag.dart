import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:get/get.dart';

class SearchItemTag extends StatelessWidget {
  final List<String> option;
  final String keyword;
  const SearchItemTag({Key key, @required this.option, @required this.keyword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(result: option.join("")),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(BDimens.gap24),
              child: Row(
                children: [
                  for (String e in option)
                    Text(
                      e,
                      style: TextStyle(
                          color: !GetUtils.isNullOrBlank(keyword) &&
                                  RegExp("$keyword", caseSensitive: false)
                                      .hasMatch(e)
                              ? BColors.blueTextColor
                              : BColors.textColor),
                    )
                ],
              )),
          Divider(
            indent: BDimens.gap24,
            endIndent: BDimens.gap24,
          )
        ],
      ),
    );
  }
}
