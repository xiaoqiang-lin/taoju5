/*
 * @Description: 用户表格
 * @Author: iamsmiling
 * @Date: 2021-02-01 14:27:10
 * @LastEditTime: 2021-02-01 14:27:11
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_table/customer_table_controller.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_table/customer_table_skeleton.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerTablePage extends GetView<CustomerTableController> {
  const CustomerTablePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        appBar: AppBar(
          title: Text(controller.category.name),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (String field in controller.fieldList)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(field),
                    )
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<CustomerTableController>(
                builder: (_) {
                  return XLoadStateBuilder(
                    builder: (BuildContext context) {
                      return SmartRefresher(
                        controller: _.refreshController,
                        onRefresh: _.loadData,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _.customerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            CustomerModel customer = _.customerList[index];
                            return GestureDetector(
                              onTap: () => _.selectCustomer(customer),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(child: Text(customer.name)),
                                        Expanded(child: Text(customer.gender)),
                                        Expanded(
                                            child: Text("${customer.age}")),
                                        Expanded(child: Text(customer.wanted)),
                                        Expanded(
                                            child: Text(customer.enterTime))
                                      ],
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    loadState: _.loadState,
                    loadingWidget: CustomerTableSkeleton(),
                    retry: _.loadData,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
