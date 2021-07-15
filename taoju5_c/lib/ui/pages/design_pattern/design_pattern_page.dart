/*
 * @Description: 设计标注
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:10:01
 * @LastEditTime: 2021-04-18 00:09:47
 */
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignPatternPage extends StatefulWidget {
  DesignPatternPage({Key? key}) : super(key: key);

  static List<String> tabs = ["待测量", "待选品", "待付款", "待发货", "待安装", "待评价", "已完成"];

  @override
  _DesignPatternPageState createState() => _DesignPatternPageState();
}

class _DesignPatternPageState extends State<DesignPatternPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设计规范"),
      ),
      body: DefaultTabController(
        length: DesignPatternPage.tabs.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                for (String item in DesignPatternPage.tabs)
                  Tab(child: Text(item))
              ],
            ),
            Expanded(
                child: TabBarView(children: [
              for (String _ in DesignPatternPage.tabs)
                Column(
                  children: [],
                )
            ]))
          ],
        ),
      ),
    );
  }
}