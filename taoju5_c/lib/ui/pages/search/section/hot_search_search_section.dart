/*
 * @Description: 大家都在搜
 * @Author: iamsmiling
 * @Date: 2021-05-24 16:18:40
 * @LastEditTime: 2021-05-24 16:21:12
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class HotSearchSection extends StatelessWidget {
  final List<String> hotWords;
  const HotSearchSection({Key? key, required this.hotWords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "大家都在搜",
            style: TextStyle(
                fontSize: R.dimen.sp14,
                color: R.color.ff333333,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp15),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: R.dimen.dp10,
              runSpacing: R.dimen.dp12,
              children: [
                for (String v in hotWords)
                  GestureDetector(
                    onTap: () {},
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
