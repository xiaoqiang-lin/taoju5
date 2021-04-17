import 'package:flutter/material.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_skeleton.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/fragment/customer_list_section_view.dart';
import 'package:taoju5_b/ui/pages/search/subpage/customer_search/customer_search_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';
import 'package:get/get.dart';

class CustomerSearchPage extends StatelessWidget {
  const CustomerSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("客户搜索结果"),
        ),
        body: GetBuilder<CustomerSearchController>(
          builder: (_) {
            return XLoadStateBuilder(
                loadState: _.loadState,
                loadingWidget: CustomerListSkeleton(),
                builder: (BuildContext context) {
                  return CustomerListSectionView(
                      onItemTap: _.onCustomerTap, customerList: _.customerList);
                });
          },
        ));
  }
}
