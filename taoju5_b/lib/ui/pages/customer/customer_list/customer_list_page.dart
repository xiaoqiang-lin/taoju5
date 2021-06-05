/*
 * @Description: 客户列表页
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:18:59
 * @LastEditTime: 2021-06-04 14:25:29
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/customer/customer_category_model.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_skeleton.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/fragment/customer_list_section_view.dart';
import 'package:taoju5_b/ui/pages/search/search_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("客户列表"),
        actions: [
          Visibility(
            // visible: Get.arguments == null,
            child: IconButton(
                icon: Icon(BIcons.search),
                onPressed: () => Get.toNamed(
                    BAppRoutes.search +
                        "?searchType=${SearchType.customer.index}",
                    arguments: Get.arguments)),
          ),
          Visibility(
            // visible: Get.arguments == null,
            child: IconButton(
                icon: Image.asset("assets/images/" + "customer_add.png"),
                onPressed: () => Get.toNamed(BAppRoutes.customerEdit,
                    arguments: Get.arguments)),
          )
        ],
      ),
      body: GetBuilder<CustomerListController>(builder: (_) {
        return Column(
          children: [
            for (CustomerCategoryModel e in _.categoryList)
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _.onCategoryTap(e),
                    child: Container(
                      color: BColors.primaryColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: BDimens.gap32, vertical: BDimens.gap16),
                      child: Row(
                        children: [
                          Image.asset("assets/images/" + e.icon),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: BDimens.gap24),
                            child: Text(e.name),
                          ),
                          Text("(${e.count})"),
                          Spacer(),
                          Icon(BIcons.next, size: 24)
                        ],
                      ),
                    ),
                  ),
                  Divider()
                ],
              ),
            Expanded(
              child: Container(
                color: Get.theme.primaryColor,
                child: XLoadStateBuilder(
                    loadState: _.loadState,
                    loadingWidget: CustomerListSkeleton(),
                    builder: (BuildContext context) {
                      return CustomerListSectionView(
                        customerList: _.customerList,
                        onItemTap: _.onCustomerTap,
                      );
                      // return AzListView(
                      //     data: _.customerList,
                      //     itemCount: _.customerList.length,
                      //     indexBarData:
                      //         _.customerList.map((e) => e.tag).toSet().toList(),
                      //     susItemBuilder: (BuildContext context, int i) {
                      //       String tag = _.customerList[i].tag;
                      //       String lastTag =
                      //           i == 0 ? "#" : _.customerList[i - 1].tag;
                      //       return Visibility(
                      //         child: Container(
                      //           color: Get.theme.scaffoldBackgroundColor,
                      //           alignment: Alignment.centerLeft,
                      //           padding: EdgeInsets.symmetric(
                      //               horizontal: BDimens.gap32,
                      //               vertical: BDimens.gap4),
                      //           child: Text(
                      //             "$tag",
                      //             textAlign: TextAlign.start,
                      //           ),
                      //         ),
                      //         visible: i == 0 ? true : tag != lastTag,
                      //       );
                      //     },
                      //     itemBuilder: (BuildContext context, int i) {
                      //       return GestureDetector(
                      //         onTap: () => _.onCustomerTap(_.customerList[i]),
                      //         child: Container(
                      //           margin: EdgeInsets.symmetric(
                      //               horizontal: BDimens.gap16),
                      //           decoration: BoxDecoration(
                      //               color: BColors.primaryColor,
                      //               border: Border(
                      //                   bottom: BorderSide(
                      //                       width: .8,
                      //                       color: BColors.dividerColor))),
                      //           alignment: Alignment.centerLeft,
                      //           padding: EdgeInsets.symmetric(
                      //               horizontal: BDimens.gap32,
                      //               vertical: BDimens.gap24),
                      //           child: Text("${_.customerList[i].name}"),
                      //         ),
                      //       );
                      //     });
                    }),
              ),
            )
          ],
        );
      }),
    );
  }
}
