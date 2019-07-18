import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';

class SelectPopWeight extends StatelessWidget {
  List<String> datas;
  Position positon;

  SelectPopWeight(this.datas, this.positon);

  String bgImg;

  @override
  Widget build(BuildContext context) {
    if (positon == Position.left) {
      bgImg = 'icon_left_pop';
    } else if (positon == Position.center) {
      bgImg = 'icon_center_pop';
    } else {
      bgImg = 'icon_right_pop';
    }

    return Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              width: 178,
              height: datas.length * 39.0 + 5,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Constant.getAssetImg(bgImg)),
                      fit: BoxFit.fill)),
              child: ListView.builder(
                  itemCount: datas.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 39.0,
                      width: 178,
                      alignment: Alignment.center,
                      child: Text(
                        datas[index],
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFAEAEAE)),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

enum Position { left, center, right }
