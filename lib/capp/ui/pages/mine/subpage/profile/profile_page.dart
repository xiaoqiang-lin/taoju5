import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/profile/profile_controller.dart';

class CProfilePage extends StatelessWidget {
  const CProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CProfileController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("个人资料"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///头像
                Container(
                  padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                  child: Row(
                    children: [
                      Text(
                        "头像",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(_.user.avatar),
                      ),
                      Icon(R.icon.next)
                    ],
                  ),
                ),
                Divider(),

                ///昵称
                Container(
                  padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                  child: Row(
                    children: [
                      Text(
                        "昵称",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      ),
                      Spacer(),
                      Text(
                        _.user.name,
                        style: TextStyle(fontSize: R.dimen.sp12),
                      ),
                      Icon(R.icon.next)
                    ],
                  ),
                ),
                Divider(),

                ///性别
                Container(
                  padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                  child: Row(
                    children: [
                      Text(
                        "性别",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      ),
                      Spacer(),
                      Text(
                        "未选择",
                        style: TextStyle(
                            fontSize: R.dimen.sp12,
                            color: R.color.tileTipColor),
                      ),
                      Icon(R.icon.next)
                    ],
                  ),
                ),
                Divider(),

                Container(
                  padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                  child: Row(
                    children: [
                      Text(
                        "生日",
                        style: TextStyle(fontSize: R.dimen.sp14),
                      ),
                      Spacer(),
                      Text("1988/08/08",
                          style: TextStyle(fontSize: R.dimen.sp12)),
                      Icon(R.icon.next)
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ),
      );
    });
  }
}
