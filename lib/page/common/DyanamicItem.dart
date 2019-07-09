import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DynamicData.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

//动态列表item
class DynamicItem extends StatefulWidget {
  final DynamicData data;

  DynamicItem({Key key, this.data}) : super(key: key);

  @override
  DynamicItemState createState() {
    return DynamicItemState(data);
  }
}

class DynamicItemState extends State<DynamicItem> {
  final DynamicData _data;

  DynamicItemState(this._data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFEEEEEE)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(_data.userHead))),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _data.userName,
                      style: TextStyle(color: Color(0xFF222222), fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text(
                      _data.time,
                      style: TextStyle(color: Color(0xFFAEAEAE), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 60,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6226),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(180), right: Radius.circular(180)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(Constant.getAssetImg('icon_follow'),
                          width: 10, height: 10),
                    ),
                    Text(
                      _data.ifFollow ? '关注' : '已关注',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 190,
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              children: <Widget>[
                Image.network(
                  _data.img,
                  height: 190,
                  width: ScreenUtil.screenW(context) - 32,
                  fit: BoxFit.cover,
                ),
//                Align(
//
//                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 9),
              child: Text(
                _data.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF222222), fontSize: 16, height: 1.5),
              )),
        ],
      ),
    );
  }
}
