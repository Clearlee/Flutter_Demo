import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/recommend_guide_data_entity.dart';
import 'package:flutter_app/constant/HttpUrl.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/constant/refresh.dart';
import 'package:flutter_app/page/common/circle_image.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../entity_factory.dart';

class GuideListPage extends StatefulWidget {
  @override
  GuideListState createState() {
    // TODO: implement createState
    return GuideListState();
  }
}

class GuideListState extends State<GuideListPage> {
  List<RecommandGuideDataDataList> _datas = [];

  int page = 1;

  GlobalKey<RefreshFooterState> _footerKeyList =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData(page);
  }

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
                      ],
                    ),
                    Center(
                      child: Text(
                        '全部导游',
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 18),
                      ),
                    )
                  ],
                )),
            Expanded(
                child: EasyRefresh(
              behavior: ScrollOverBehavior(),
              refreshFooter: Refresh.footerList(_footerKeyList),
              child: ListView.builder(
                  itemCount: _datas.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GuideItemWeight(_datas[index]);
                  }),
              loadMore: () async {
                await new Future.delayed(const Duration(seconds: 1), () {
                  _loadData(++page);
                });
              },
            ))
          ],
        ));
  }

  void _loadData(int page) async {
    try {
      Response response = await Dio().get(HttpUrl.getGuideListUrl(page));
      RecommendGuideDataEntity dataEntity =
          EntityFactory.generateOBJ<RecommendGuideDataEntity>(response.data);
      if (dataEntity != null &&
          dataEntity.success &&
          dataEntity.data.xList.length > 0) {
        setState(() {
          print(dataEntity.data.xList.length);
          _datas.addAll(dataEntity.data.xList);
        });
      } else {
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }
}

class GuideItemWeight extends StatelessWidget {
  final RecommandGuideDataDataList _guideItem;

  GuideItemWeight(this._guideItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(left: 19, right: 18),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleImage(
                url: _guideItem.headImg,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        _guideItem.nickName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Color(0xFF222222), fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                      ),
//                      Image.asset(
//                        Constant.getAssetImg(''),
//                        width: 43,
//                        height: 19,
//                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                  ),
                  Text(
                    '${_guideItem.fans}粉丝 · ${_guideItem.follows}关注 · ${_guideItem.like}获赞',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFF999999), fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 60,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFF6226),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(180), right: Radius.circular(180)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Offstage(
                    offstage: !_guideItem.followEachOther,
                    child: Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(Constant.getAssetImg('icon_follow'),
                          width: 10, height: 10),
                    ),
                  ),
                  Text(
                    _guideItem.followEachOther ? '关注' : '已关注',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
