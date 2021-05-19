/*
 * @Description: 窗型
 * @Author: iamsmiling
 * @Date: 2021-05-11 14:34:47
 * @LastEditTime: 2021-05-12 16:44:27
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/expansion_tile/attribute_expansion_tile.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_facade_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_install_mode_entity.dart';
import 'package:taoju5_c/res/R.dart';

class WindowPatternExpansionPanel extends StatelessWidget {
  final CurtainMeasureDataAttributeEntity measureData;
  final Function(WindowFacadeEntity facade, WindowFacadeOptionEntity option)
      onWindowFacadeChanged;
  final Function(WindowInstalllModeEntity installMode,
      WindowInstallModeOptionEntity option) onInstallModeChanged;
  const WindowPatternExpansionPanel(
      {Key? key,
      required this.onWindowFacadeChanged,
      required this.onInstallModeChanged,
      required this.measureData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AttributeExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          title: Text(
            measureData.facade.label,
            style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
          ),
          collapsedBackgroundColor: R.color.transparent,
          backgroundColor: R.color.transparent,
          trailingLabel: Text(
            measureData.facade.value,
            style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: Column(
                // spacing: R.dimen.dp10,
                // runSpacing: R.dimen.dp14 / 2,
                children: [
                  for (WindowFacadeEntity item in measureData.facade.children)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: R.dimen.dp5, top: R.dimen.dp10),
                          child: Text(
                            item.label,
                            style: TextStyle(
                                color: R.color.ff999999,
                                fontSize: R.dimen.sp12),
                          ),
                        ),
                        Row(
                          children: [
                            for (WindowFacadeOptionEntity option
                                in item.options)
                              GestureDetector(
                                onTap: () =>
                                    onWindowFacadeChanged(item, option),
                                child: Container(
                                  margin: EdgeInsets.only(right: R.dimen.dp10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(R.dimen.sp7),
                                      border: Border.all(
                                          color: option.selected
                                              ? R.color.ffee9b5f
                                              : Colors.transparent)),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(R.dimen.sp7),
                                    child: Image.asset(
                                      "assets/images/" + option.image,
                                      width: 77,
                                      height: 77,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: R.dimen.dp14),
          width: R.dimen.width,
          child: Image.asset(
            "assets/images/" + measureData.mainImage,
            height: 300,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: R.dimen.dp7, left: R.dimen.dp20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: R.dimen.dp15),
                child: Text(measureData.installMode.label,
                    style: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.ff333333)),
              ),
              for (WindowInstallModeOptionEntity option
                  in measureData.installOptions)
                PrimaryButton(
                  text: option.name,
                  textStyle: TextStyle(fontSize: R.dimen.sp12),
                  onPressed: () =>
                      onInstallModeChanged(measureData.installMode, option),
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp12),
                  radius: R.dimen.sp4,
                  margin: EdgeInsets.only(right: R.dimen.dp10),
                  mode: option.selected
                      ? PrimaryButtonMode.elevatedButton
                      : PrimaryButtonMode.outlinedButton,
                )
            ],
          ),
        )
      ],
    );
  }
}
