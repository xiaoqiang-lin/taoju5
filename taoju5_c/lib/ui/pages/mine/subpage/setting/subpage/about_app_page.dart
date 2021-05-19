/*
 * @Description: 关于淘居屋
 * @Author: iamsmiling
 * @Date: 2021-05-13 14:26:19
 * @LastEditTime: 2021-05-13 14:42:27
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于淘居屋"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          margin: EdgeInsets.only(top: R.dimen.dp72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(R.dimen.sp7),
                    border: Border.all(
                      width: 1,
                    )),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(R.dimen.sp7),
                    child: Image.asset("assets/images/logo.png")),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: R.dimen.dp15, bottom: R.dimen.dp50),
                child: Text(
                  "当前版本:1.3.4",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.ff666666),
                ),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp18),
                      child: Text(
                        "用户协议",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      )),
                  Spacer(),
                  Image.asset(R.image.next),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp18),
                      child: Text(
                        "隐私政策",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      )),
                  Spacer(),
                  Image.asset(R.image.next),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(bottom: R.dimen.dp100),
        child: Column(
          children: [
            Text(
              "Copyright©2020",
              style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff999999),
            ),
            Text(
              "淘居屋.com版权所有",
              style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff999999),
            )
          ],
        ),
      ),
    );
  }
}
