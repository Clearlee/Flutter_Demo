import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DynamicData.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/common/overflow_weight.dart';
import 'package:flutter_app/page/common/speed_dial_weight.dart';

//资讯详情
class DynamicDetailPage extends StatefulWidget {
  DynamicData dynamicData;

  DynamicDetailPage({this.dynamicData, Key key}) : super(key: key);

  @override
  DynamicDetailPageState createState() {
    // TODO: implement createState
    return DynamicDetailPageState(dynamicData);
  }
}

class DynamicDetailPageState extends State<DynamicDetailPage> {
  DynamicData _data;

  DynamicDetailPageState(this._data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                margin: EdgeInsets.only(top: 30),
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset(
                            Constant.getAssetImg('ic_arrow_back'),
                            width: 20,
                            height: 20,
                          ),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              Constant.getAssetImg('icon_chat'),
                              width: 20,
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 21),
                              child: Image.asset(
                                Constant.getAssetImg('icon_share'),
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        '动态详情',
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 18),
                      ),
                    )
                  ],
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                                  backgroundImage:
                                      NetworkImage(_data.userHead))),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _data.userName,
                                  style: TextStyle(
                                      color: Color(0xFF222222), fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                Text(
                                  _data.time,
                                  style: TextStyle(
                                      color: Color(0xFFAEAEAE), fontSize: 12),
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
                                  _data.ifFollow ? '关注' : '已关注',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: SpeedDialWeight(_data.imgsDatas)),
                      Container(
                          margin: EdgeInsets.only(top: 9),
                          child: Text(
                            _data.content,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 16,
                                height: 1.5),
                          )),
                      Row(
                        //外层必须嵌套一层 否则Container的宽度会撑满屏幕 https://zhuanlan.zhihu.com/p/41801871
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(180),
                                  right: Radius.circular(180)),
                              color: Color(0xFFF0F0F0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  Constant.getAssetImg('icon_local'),
                                  width: 12,
                                  height: 14,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    _data.location,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Color(0xFF666666), fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 24,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: OverFlowWeight(
                                datas: _data.urlDatas,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${_data.likeNum}赞过',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Color(0xFF222222), fontSize: 14),
                              ),
                            ),
                            Image.asset(
                              _data.ifLike
                                  ? Constant.getAssetImg('icon_liked')
                                  : Constant.getAssetImg('icon_like'),
                              width: 22,
                              height: 22,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
