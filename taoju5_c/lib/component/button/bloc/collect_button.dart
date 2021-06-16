/*
 * @Description: 收藏按钮
 * @Author: iamsmiling
 * @Date: 2021-06-08 17:04:06
 * @LastEditTime: 2021-06-08 17:43:15
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/animated_button.dart';
import 'package:taoju5_c/domain/repository/collection_repository.dart';
import 'package:taoju5_c/res/R.dart';

enum CollectionCategory { product, article, scene, store }

extension CollectionCategoryKit on CollectionCategory {
  int get code =>
      {
        CollectionCategory.product: 1,
        CollectionCategory.scene: 2,
        CollectionCategory.article: 3,
        CollectionCategory.store: 4
      }[this] ??
      -1;
}

class CollectButton extends StatefulWidget {
  final String? id;
  final CollectionCategory category;
  final bool like;
  CollectButton({Key? key, this.id, required this.category, this.like = false})
      : super(key: key);

  @override
  _CollectButtonState createState() => _CollectButtonState();
}

class _CollectButtonState extends State<CollectButton> {
  CollectionRepository _repository = CollectionRepository();

  late bool like;

  Future<bool> _collect() {
    return _repository.collect(
        {"fav_id": widget.id, "fav_type": widget.category.code}).then((value) {
      like = true;
      return true;
    });
  }

  Future<bool> _cancelCollect() {
    return _repository.cancelCollect(
        {"fav_id": widget.id, "fav_type": widget.category.code}).then((value) {
      like = false;
      return false;
    });
  }

  Future<bool> collect() {
    if (like) {
      return _cancelCollect();
    }
    return _collect();
  }

  @override
  void initState() {
    like = widget.like;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        active: like,
        onPressed: collect,
        activeWidget: Image.asset(R.image.hasCollected),
        deactiveWidget: Image.asset(R.image.notCollect));
  }
}
