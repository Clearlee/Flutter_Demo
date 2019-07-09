import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/demo/NestedScrollViewWidget.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

import 'news_weight.dart';

class StikyWeight extends StatefulWidget {
  @override
  _HomeWeightState createState() {
    // TODO: implement createState
    return _HomeWeightState();
  }
}

class _HomeWeightState extends State<StikyWeight>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<StikyWeight> {
  var _tabs = ['关注', '全部', '快讯'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                    forceElevated: innerBoxIsScrolled,
                    backgroundColor: Colors.blue,
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/25e65b5352b841d3a93741e9daf3626a',
                          width: ScreenUtil.screenW(context),
                          height: 210,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: 25, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(180),
                                              right: Radius.circular(180)),
                                          border: Border.all(
                                              color: Color(0xFFDDDDDD),
                                              width: 0.5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image.asset(
                                            Constant.getAssetImg('icon_search'),
                                            width: 16,
                                            height: 16,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: '12月最佳旅行地',
                                                  hintStyle: TextStyle(
                                                      color:
                                                          Color(0xFF999999))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Image.asset(
                                    Constant.getAssetImg('icon_scan'),
                                    width: 20,
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenUtil.screenW(context),
                              padding: EdgeInsets.only(
                                  left: 26, right: 26, top: 11, bottom: 20),
                              margin: EdgeInsets.only(
                                  top: 125, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Constant.getAssetImg(
                                          'icon_shape_bg')),
                                      fit: BoxFit.fill)),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          Constant.getAssetImg('icon_guides'),
                                          width: 40,
                                          height: 40,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 9),
                                          child: Text(
                                            '导游排行',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF222222)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 21,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          new MaterialPageRoute(
                                              builder: (context) {
                                        return new NestedScrollViewWidget();
                                      }));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          Constant.getAssetImg('icon_trips'),
                                          width: 40,
                                          height: 40,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 9),
                                          child: Text(
                                            '行程定制',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF222222)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    bottom: PreferredSize(
                        child: Container(),
                        preferredSize: Size.fromHeight(190))),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(Container(
                    height: 50,
                    child: TabBar(
                        unselectedLabelColor: Color(0xFFAEAEAE),
                        labelColor: Color(0xFF222222),
                        indicatorColor: Color(0xFFFF6226),
                        unselectedLabelStyle: TextStyle(fontSize: 16),
                        labelStyle: TextStyle(fontSize: 18),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: _tabs
                            .map((name) => Container(
                                  child: Text(
                                    name,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                ))
                            .toList()),
                  )))
            ];
          },
          body: TabBarView(
              children: _tabs.map((item) {
            return NewsWeight(content: item);
          }).toList())),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
