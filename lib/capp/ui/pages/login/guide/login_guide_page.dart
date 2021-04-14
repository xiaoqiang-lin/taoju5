import 'package:flutter/material.dart';
import 'package:taoju5/capp/component/button/primary_button.dart';
import 'package:taoju5/capp/res/R.dart';

class CLoginGuidePage extends StatelessWidget {
  const CLoginGuidePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: kToolbarHeight * 2 + R.dimen.dp20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(R.dimen.sp10),
                      border: Border.all(color: Colors.black)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(R.dimen.sp10),
                      child: Image.asset("assets/images/logo.png"))),
              Container(
                margin:
                    EdgeInsets.only(top: R.dimen.dp100, bottom: R.dimen.dp20),
                child: PrimaryButton(
                  onPressed: () {},
                  text: "用户登录/注册",
                  size: PrimaryButtonSize.large,
                  mode: PrimaryButtonMode.elevatedButton,
                ),
              ),
              PrimaryButton(
                onPressed: () {},
                text: "商户登录",
                size: PrimaryButtonSize.large,
                mode: PrimaryButtonMode.outlinedButton,
              ),
              PrimaryButton(
                onPressed: () {},
                size: PrimaryButtonSize.mini,
                text: "搜素",
              ),
              PrimaryButton(
                onPressed: () {},
                size: PrimaryButtonSize.middle,
                text: "删除",
              ),
              PrimaryButton(
                onPressed: () {},
                mode: PrimaryButtonMode.outlinedButton,
                size: PrimaryButtonSize.middle,
                text: "删除",
              ),
              PrimaryButton(
                onPressed: () {},
                mode: PrimaryButtonMode.textButton,
                size: PrimaryButtonSize.middle,
                text: "删除",
              ),
              PrimaryButton(
                onPressed: () {},
                mode: PrimaryButtonMode.materialButton,
                size: PrimaryButtonSize.middle,
                text: "删除",
              )
            ],
          ),
        ),
      ),
    );
  }
}
