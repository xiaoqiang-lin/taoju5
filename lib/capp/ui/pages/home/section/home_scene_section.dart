import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';

class CHomeSceneSection extends StatelessWidget {
  const CHomeSceneSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("场景搭配", style: R.style.h2),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
