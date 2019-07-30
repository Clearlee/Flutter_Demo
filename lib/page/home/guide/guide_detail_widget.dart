import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/common/circle_image.dart';
import 'package:flutter_app/page/home/news_weight.dart';

class GuideDetailPage extends StatefulWidget {
  @override
  GuideDetailPageState createState() {
    // TODO: implement createState
    return GuideDetailPageState();
  }
}

class GuideDetailPageState extends State<GuideDetailPage>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<GuideDetailPage> {
  var _tabs = ['动态', '行程'];

  ScrollController _scrollController; //必须要有，控制联动

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
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
                        GestureDetector(
                          onTap: () => _showDialog(),
                          child: Image.asset(
                            Constant.getAssetImg('icon_share'),
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        '徐弛',
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 18),
                      ),
                    )
                  ],
                )),
            Expanded(
              child: DefaultTabController(
                length: _tabs.length, // This is the number of tabs.
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        child: SliverAppBar(
                          titleSpacing: 0,
                          backgroundColor: Colors.white,
                          forceElevated: innerBoxIsScrolled,
                          bottom: PreferredSize(
                              child: Container(
                                color: Colors.white,
                              ),
                              preferredSize: Size.fromHeight(140)),
                          flexibleSpace: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 5),
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: <Widget>[
                                    CircleImage(
                                      url:
                                          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
                                      width: 60,
                                      height: 60,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        Constant.getAssetImg('icon_male'),
                                        width: 16,
                                        height: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                '导游证号：PY-06-1038',
                                style: TextStyle(
                                    color: Color(0xFFAEAEAE), fontSize: 12),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Color(0xFFAEAEAE),
                                                width: 1)),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: '78',
                                            style: TextStyle(
                                                color: Color(0xFF222222),
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '粉丝',
                                            style: TextStyle(
                                                color: Color(0xFFAEAEAE),
                                                fontSize: 14)),
                                      ])),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Color(0xFFAEAEAE),
                                                width: 1)),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: '12',
                                            style: TextStyle(
                                                color: Color(0xFF222222),
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '关注',
                                            style: TextStyle(
                                                color: Color(0xFFAEAEAE),
                                                fontSize: 14)),
                                      ])),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: '3217',
                                            style: TextStyle(
                                                color: Color(0xFF222222),
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '获赞',
                                            style: TextStyle(
                                                color: Color(0xFFAEAEAE),
                                                fontSize: 14)),
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFF0EB),
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(180),
                                            right: Radius.circular(180))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 9),
                                    child: Text(
                                      '藏族',
                                      style: TextStyle(
                                          color: Color(0xFFFF6226),
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFF0EB),
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(180),
                                            right: Radius.circular(180))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 9),
                                    child: Text(
                                      '日语、英语',
                                      style: TextStyle(
                                          color: Color(0xFFFF6226),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: Text(
                                  '签名或自我介绍签名或自我介绍，签名或自我介绍签名或自我介绍，签名或自我介绍',
                                  style: TextStyle(
                                      color: Color(0xFF666666), fontSize: 14),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 10))),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          Container(
                              color: Colors.white,
                              height: 50,
                              child: Container(
                                child: TabBar(
                                    unselectedLabelColor: Color(0xFFAEAEAE),
                                    labelColor: Color(0xFF222222),
                                    indicatorColor: Color(0xFFFF6226),
                                    unselectedLabelStyle:
                                        TextStyle(fontSize: 16),
                                    labelStyle: TextStyle(fontSize: 18),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: _tabs
                                        .map((name) => Container(
                                              child: Text(
                                                name,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                            ))
                                        .toList()),
                              )),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                      children: _tabs.map((item) {
                    return NewsWeight(
                      content: item,
                      controller: _scrollController,
                    );
                  }).toList()),
                ),
              ),
            )
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _showDialog() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 190,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 14, left: 16, right: 21,bottom: 17),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFE0E0E0), width: 1))),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '分享可获得兔币奖励',
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    Constant.getAssetImg('icon_wechat'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      '微信好友',
                                      style: TextStyle(
                                          color: Color(0xFF666666),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    Constant.getAssetImg('icon_friends'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      '朋友圈',
                                      style: TextStyle(
                                          color: Color(0xFF666666),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    Constant.getAssetImg('icon_weibo'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      '新浪微博',
                                      style: TextStyle(
                                          color: Color(0xFF666666),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    Constant.getAssetImg('icon_link'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      '复制链接',
                                      style: TextStyle(
                                          color: Color(0xFF666666),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '取消',
                    style: TextStyle(color: Color(0xFF222222), fontSize: 18),
                  ),
                )
              ],
            ),
          );
        });
  }
}

///TabBar的代理
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
