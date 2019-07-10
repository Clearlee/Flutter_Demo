import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DynamicData.dart';
import 'package:flutter_app/page/common/DyanamicItem.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NewsWeight extends StatefulWidget {
  final String content;

  ScrollController controller;

  NewsWeight({Key key, this.content, this.controller}) : super(key: key);

  @override
  _NewsWeightState createState() {
    // TODO: implement createState
    return _NewsWeightState(content, controller);
  }
}

class _NewsWeightState extends State<NewsWeight>
    with SingleTickerProviderStateMixin {
  GlobalKey<RefreshHeaderState> _headerKeyList =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _connectorFooterKeyList =
      new GlobalKey<RefreshFooterState>();
  GlobalKey<RefreshHeaderState> _connectorHeaderKeyList =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKeyList =
      new GlobalKey<RefreshFooterState>();

  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final String content;

  _NewsWeightState(this.content, this._controller);

  List<DynamicData> _data = [
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫1',
        '2 周前',
        '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫2',
        '2 周前',
        '张掖七彩丹霞国家地质公园、马蹄张掖七彩丹霞 国家地质公园、马蹄寺张掖七彩丹霞国家地质公 园、马蹄张掖七彩丹霞',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫3',
        '2 周前',
        '六天的时间，我们去了历史悠久的塔尔寺，看了一场浪漫的日出日落，纯净的茶卡盐湖像天堂一样美丽！',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫4',
        '2 周前',
        '183***2323的用户购买了您的行程产品：行程名称行程名称行程名称行程名称行程名称行程名… 请开始为游客进行旅行服务吧！',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
  ];

  List<DynamicData> _newData = [
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n1',
        '2 周前',
        '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n2',
        '2 周前',
        '张掖七彩丹霞国家地质公园、马蹄张掖七彩丹霞 国家地质公园、马蹄寺张掖七彩丹霞国家地质公 园、马蹄张掖七彩丹霞',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n3',
        '2 周前',
        '六天的时间，我们去了历史悠久的塔尔寺，看了一场浪漫的日出日落，纯净的茶卡盐湖像天堂一样美丽！',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n4',
        '2 周前',
        '183***2323的用户购买了您的行程产品：行程名称行程名称行程名称行程名称行程名称行程名… 请开始为游客进行旅行服务吧！',
        '环球中心',
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        0,
        true,
        false),
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerList = ClassicsHeader(
      key: _headerKeyList,
      refreshText:
          "pullToRefresh" /*Translations.of(context).text("pullToRefresh")*/,
      refreshReadyText: "releaseToRefresh",
      refreshingText: "refreshing",
      refreshedText: "refreshed",
      moreInfo: "updateAt",
      bgColor: Colors.transparent,
      textColor: Colors.black,
    );
    Widget footerList = ClassicsFooter(
      key: _footerKeyList,
      loadHeight: 50.0,
      loadText: "pushToLoad",
      loadReadyText: "releaseToLoad",
      loadingText: "loading",
      loadedText: "loaded",
      noMoreText: "noMore",
      moreInfo: "updateAt",
      bgColor: Colors.transparent,
      textColor: Colors.black,
    );

    return SafeArea(
        top: false,
        bottom: false,
        child: Builder(builder: (context) {
          return EasyRefresh(
            outerController: _controller,
            refreshHeader: ConnectorHeader(
                key: _connectorHeaderKeyList, header: headerList),
            refreshFooter: ConnectorFooter(
                key: _connectorFooterKeyList, footer: footerList),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              semanticChildCount: _data.length,
              slivers: <Widget>[
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[headerList]),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        ((BuildContext context, int index) {
                  return DynamicItem(
                    data: _data[index],
                  );
                }), childCount: _data.length)),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[footerList]),
                )
              ],
            ),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _data.clear();
                  _data.addAll(_newData);
                });
              });
            },
            loadMore: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                if (_data.length < 20) {
                  setState(() {
                    _data.addAll(_newData);
                  });
                }
              });
            },
          );
        }));
  }
}
