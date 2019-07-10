import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/demo/NestedScrollViewWidget.dart';
import 'package:flutter_app/util/ScreenUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'news_weight.dart';

class HomeWeight extends StatefulWidget {
  @override
  _HomeWeightState createState() {
    // TODO: implement createState
    return _HomeWeightState();
  }
}

class _HomeWeightState extends State<HomeWeight> {
  var _tabs = ['关注', '全部', '快讯'];

  List<String> _banners = [
    'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/931d833df48b4bfaafa01621d46bc4d2',
    'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/25e65b5352b841d3a93741e9daf3626a'
  ];

  double _opacity = 0;

  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _opacity = _scrollController.offset / 176.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        DefaultTabController(
          initialIndex: 0,
          length: _tabs.length,
          child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverAppBar(
                        pinned: true,
                        expandedHeight: 280,
                        primary: true,
                        titleSpacing: 0,
                        forceElevated: innerBoxIsScrolled,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: Container(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 210,
                                  child: Swiper(
                                    itemCount: _banners.length,
                                    itemWidth: ScreenUtil.screenW(context),
                                    itemBuilder: (context, index) {
                                      return Image.network(
                                        _banners[index],
                                        width: ScreenUtil.screenW(context),
                                        height: 210,
                                        fit: BoxFit.fill,
                                      );
                                    },
                                    autoplay: true,
                                    duration: 150,
                                    controller: SwiperController(),
                                    scrollDirection: Axis.horizontal,
                                    pagination: SwiperPagination(
                                        builder: DotSwiperPaginationBuilder(
                                            color: Color(0x80FFFFFF),
                                            activeColor: Colors.white,
                                            size: 10,
                                            activeSize: 10,
                                            space: 5),
                                        margin: EdgeInsets.only(bottom: 30)),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: ScreenUtil.screenW(context),
                                      padding: EdgeInsets.only(
                                          left: 26,
                                          right: 26,
                                          top: 11,
                                          bottom: 20),
                                      margin: EdgeInsets.only(
                                          top: 185, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  Constant.getAssetImg(
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
                                                  Constant.getAssetImg(
                                                      'icon_guides'),
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    '导游排行',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF222222)),
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
                                                  Constant.getAssetImg(
                                                      'icon_trips'),
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    '行程定制',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF222222)),
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
                          ),
                        ),
                        bottom: TabBar(
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
                                .toList())),
                  ),
                ];
              },
              body: TabBarView(
                  children: _tabs.map((item) {
                return NewsWeight(
                  content: item,
                  controller: _scrollController,
                );
              }).toList())),
        ),
        Opacity(
          opacity: _opacity,
          child: Container(
            height: 80,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(180),
                          right: Radius.circular(180)),
                      border: Border.all(color: Color(0xFFDDDDDD), width: 0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              hintStyle: TextStyle(color: Color(0xFF999999))),
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
                Constant.getAssetImg(
                    _opacity > 0.5 ? 'icon_scan_black' : 'icon_scan'),
                width: 20,
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
