import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/mine/mine_controller.dart';

class CMineFooterSection extends StatelessWidget {
  final List<CMineTileEntity> tiles;
  const CMineFooterSection({Key key, @required this.tiles})
      : assert(tiles != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: R.dimen.dp5),
            child: Text("其他", style: R.style.headline6),
          ),
          for (CMineTileEntity item in tiles)
            GestureDetector(
              onTap: item.onTap,
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Image.asset(item.icon),
                        Container(
                          margin: EdgeInsets.only(left: R.dimen.dp5),
                          child: Text(
                            item.label,
                            style: TextStyle(fontSize: R.dimen.sp12),
                          ),
                        ),
                        Spacer(),
                        Icon(R.icon.next)
                      ],
                    ),
                  ),
                  Visibility(
                      visible: item != tiles.last,
                      child: Divider(indent: 0, endIndent: 0))
                ],
              ),
            )
        ],
      ),
    );
  }
}
