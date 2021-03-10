/*
 * @Description: 选择属性的工具类
 * @Author: iamsmiling
 * @Date: 2020-12-24 14:11:38
 * @LastEditTime: 2021-01-19 13:52:54
 */
import 'package:flutter/cupertino.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/curtain_product_attr_selector_modal.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';

class CurtainProductAttrSelectorKit {
  ///选择空间
  static Future selectRoom<T>(BuildContext context,
      BaseCurtainProductAttrsSelectorController controller) {
    CurtainProductAttrModel model = controller.room;
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CurtainProductAttrSelectorModal(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (CurtainProductAttrOptionModel option
                          in model.optionList)
                        XCheckButton(
                          isChecked: option.isChecked,
                          onPresss: () {
                            controller.select(model, currentOption: option);
                            setState(() {});
                          },
                          child: Text(option.name),
                        )
                    ],
                  ),
                );
              });
            },
          );
        });
  }

  ///选择窗纱
  static Future selectGauze<T>(BuildContext context,
      BaseCurtainProductAttrsSelectorController controller) {
    CurtainProductAttrModel model = controller.gauze;
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CurtainProductAttrSelectorModal(
            onConfirm: () {
              ///过滤
              controller.filterCraft(
                  hasBox: false,
                  hasGauze: controller.hasGauze,
                  model: controller.craft);

              controller.filterSectionalBar(
                  hasBox: false,
                  hasHole: controller.hasHole,
                  model: controller.sectionalBar);
            },
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (CurtainProductAttrOptionModel option
                          in model.optionList)
                        XCheckButton(
                          isChecked: option.isChecked,
                          onPresss: () {
                            controller.select(model, currentOption: option);

                            setState(() {});
                          },
                          child: Text(option.name),
                        )
                    ],
                  ),
                );
              });
            },
          );
        });
  }

  ///选择工艺
  static Future selectCraft<T>(BuildContext context,
      BaseCurtainProductAttrsSelectorController controller) {
    CurtainProductAttrModel model = controller.craft;
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CurtainProductAttrSelectorModal(
            onConfirm: () {
              ///过滤型材
              controller.filterSectionalBar(
                  hasBox: false,
                  hasHole: controller.hasHole,
                  model: controller.sectionalBar);
            },
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (CurtainProductAttrOptionModel option
                          in model.optionList)
                        XCheckButton(
                          isChecked: option.isChecked,
                          onPresss: () {
                            controller.select(model, currentOption: option);
                            setState(() {});
                          },
                          child: Text(option.name),
                        )
                    ],
                  ),
                );
              });
            },
          );
        });
  }

  ///选择型材
  static Future selectSectionalBar<T>(BuildContext context,
      BaseCurtainProductAttrsSelectorController controller) {
    CurtainProductAttrModel model = controller.sectionalBar;
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CurtainProductAttrSelectorModal(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (CurtainProductAttrOptionModel option
                          in model.optionList)
                        XCheckButton(
                          isChecked: option.isChecked,
                          onPresss: () {
                            controller.select(model, currentOption: option);
                            setState(() {});
                          },
                          child: Text(option.name),
                        )
                    ],
                  ),
                );
              });
            },
          );
        });
  }
}
