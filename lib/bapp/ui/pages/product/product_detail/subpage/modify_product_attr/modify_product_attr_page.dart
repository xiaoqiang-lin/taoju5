/*
 * @Description: 修改商品属性
 * @Author: iamsmiling
 * @Date: 2021-01-23 15:58:02
 * @LastEditTime: 2021-01-27 16:26:08
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/product_attrs_selector_card.dart';

class ModifyProductAttrPage extends StatelessWidget {
  const ModifyProductAttrPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改属性"),
      ),
      body: SingleChildScrollView(
        child: ProductAttrsSelectorCard(),
      ),
    );
  }
}
