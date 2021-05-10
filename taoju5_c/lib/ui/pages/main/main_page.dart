/*
 * @Description: app入口页面
 * @Author: iamsmiling
 * @Date: 2021-04-20 19:11:22
 * @LastEditTime: 2021-05-06 11:12:43
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/main/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Scaffold(
        body: IndexedStack(
          index: _.currentIndex,
          children: _.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _.currentIndex,
          onTap: _.switchTo,
          items: [
            for (var item in _.navigationItemEntities)
              BottomNavigationBarItem(
                  icon: Image.asset(item.icon),
                  label: item.title,
                  tooltip: item.title,
                  activeIcon: Image.asset(item.activeIcon))
          ],
        ),
      );
    });
  }
}
