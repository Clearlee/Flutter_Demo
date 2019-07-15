import 'package:flutter/material.dart';
import 'package:flutter_app/bean/GuideData.dart';
import 'package:flutter_app/constant/constant.dart';

class GuideRecommendWeight extends StatelessWidget {
  final List<GuideData> _guideData;

  GuideRecommendWeight(this._guideData);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      height: 190,
      padding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '导游排行',
            style: TextStyle(color: Color(0xFF222222), fontSize: 16),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _guideData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 35),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(180)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _guideData[index].guideHead),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              '导游排行',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF222222), fontSize: 14),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6226),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(180),
                                  right: Radius.circular(180)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Image.asset(
                                      Constant.getAssetImg('icon_follow'),
                                      width: 10,
                                      height: 10),
                                ),
                                Text(
                                  _guideData[index].ifFollow ? '关注' : '已关注',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
