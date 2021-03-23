import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:get/get.dart';

class SearchItemTag extends StatelessWidget {
  final String keyword;
  const SearchItemTag({Key key, this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(result: keyword),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(BDimens.gap24), child: Text(keyword)),
          Divider(
            indent: BDimens.gap24,
            endIndent: BDimens.gap24,
          )
        ],
      ),
    );
  }
}
