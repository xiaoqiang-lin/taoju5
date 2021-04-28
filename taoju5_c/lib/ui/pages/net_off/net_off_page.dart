/*
 * @Description: 网络错误 缺省页面
 * @Author: iamsmiling
 * @Date: 2021-04-27 10:55:37
 * @LastEditTime: 2021-04-27 11:09:50
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class NetOffPage extends StatelessWidget {
  const NetOffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        height: R.dimen.height,
        child: Column(
          children: [
            Image.asset(R.image.offline),
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp30),
              child: Text(
                "网络开小差了，点击屏幕重新加载~",
                style:
                    TextStyle(fontSize: R.dimen.dp14, color: R.color.ff666666),
              ),
            )
          ],
        ),
      ),
    );
  }
}
