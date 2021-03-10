/*
 * @Description: App功能模块
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:16:53
 * @LastEditTime: 2021-01-12 22:45:22
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/app/app_module_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class AppModuleCard extends StatelessWidget {
  final AppModuleModel module;
  const AppModuleCard({Key key, @required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: module.onTap,
      child: Card(
        color: BColors.cardColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: BDimens.gap24),
              child: Image.asset("assets/images/" + module.icon),
            ),
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: BDimens.gap8),
                    child: Text(
                      module.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: BColors.headlineColor,
                          fontSize: BDimens.sp28),
                    ),
                  ),
                  Text(
                    module.description,
                    style: TextStyle(fontSize: BDimens.sp22),
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
