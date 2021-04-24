/*
 * @Description: 商品列表页面
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:28:28
 * @LastEditTime: 2021-04-23 20:53:20
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_.category.name),
            actions: [Image.asset(R.image.find)],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "默认",
                      style: TextStyle(
                          color: R.color.ffff5005,
                          fontSize: R.dimen.sp13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("销量排序"),
                    Text("新品优先"),
                    Row(
                      children: [Text("价格排序"), Image.asset(R.image.priceAsc)],
                    ),
                    Image.asset(R.image.listMode)
                  ],
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: R.dimen.dp16,
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                          mainAxisSpacing: R.dimen.dp16),
                      itemCount: _.products.length,
                      itemBuilder: (BuildContext context, int i) {
                        ProductEntity item = _.products[i];
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(item.cover),
                              Text(item.name),
                            ],
                          ),
                        );
                      }))
            ],
          ),
        );
      },
    );
  }
}
