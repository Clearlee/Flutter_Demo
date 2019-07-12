import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DynamicData.dart';
import 'package:flutter_app/page/common/DyanamicItem.dart';
import 'package:flutter_app/router/Router.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NewsWeight extends StatefulWidget {
  final String content;
  final ScrollController controller;

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
        0,
        true,
        true,
        imgsDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6'
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/bc5t6wrxoo1562914993755.jpg?x-oss-process=style/news',
        '饶雪漫2',
        '2 周前',
        '张掖七彩丹霞国家地质公园、马蹄张掖七彩丹霞 国家地质公园、马蹄寺张掖七彩丹霞国家地质公 园、马蹄张掖七彩丹霞',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/xx4ona4pmc1562911104935.jpg?x-oss-process=style/news',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6'
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫3',
        '2 周前',
        '六天的时间，我们去了历史悠久的塔尔寺，看了一场浪漫的日出日落，纯净的茶卡盐湖像天堂一样美丽！',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/52e758a0cbb34d92a773f3d23b7c6dcb',
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/xx4ona4pmc1562911104935.jpg?x-oss-process=style/news',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6'
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫4',
        '2 周前',
        '183***2323的用户购买了您的行程产品：行程名称行程名称行程名称行程名称行程名称行程名… 请开始为游客进行旅行服务吧！',
        '环球中心',
        0,
        true,
        true,
        imgsDatas: [
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/wv56t30kim1562907274250.jpg?x-oss-process=style/news',
          'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/52e758a0cbb34d92a773f3d23b7c6dcb',
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/xx4ona4pmc1562911104935.jpg?x-oss-process=style/news',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫1',
        '2 周前',
        '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
        '环球中心',
        0,
        true,
        true,
        imgsDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫4',
        '2 周前',
        '183***2323的用户购买了您的行程产品：行程名称行程名称行程名称行程名称行程名称行程名… 请开始为游客进行旅行服务吧！',
        '环球中心',
        0,
        true,
        true,
        imgsDatas: [
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/wv56t30kim1562907274250.jpg?x-oss-process=style/news',
          'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/52e758a0cbb34d92a773f3d23b7c6dcb',
          'https://lianxiangfiles.oss-cn-beijing.aliyuncs.com/article/xx4ona4pmc1562911104935.jpg?x-oss-process=style/news',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ]),
  ];

  List<DynamicData> _newData = [
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n1',
        '2 周前',
        '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n2',
        '2 周前',
        '张掖七彩丹霞国家地质公园、马蹄张掖七彩丹霞 国家地质公园、马蹄寺张掖七彩丹霞国家地质公 园、马蹄张掖七彩丹霞',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n3',
        '2 周前',
        '六天的时间，我们去了历史悠久的塔尔寺，看了一场浪漫的日出日落，纯净的茶卡盐湖像天堂一样美丽！',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://pulsar-resource.oss-cn-shanghai.aliyuncs.com/operate/1d76905cd8674f459e6137c95f5d445a',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ]),
    DynamicData(
        'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        '饶雪漫n4',
        '2 周前',
        '183***2323的用户购买了您的行程产品：行程名称行程名称行程名称行程名称行程名称行程名… 请开始为游客进行旅行服务吧！',
        '环球中心',
        0,
        true,
        false,
        imgsDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/71be4480770f48fdb5e998bd282702c6',
        ],
        urlDatas: [
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
        ]),
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
                  return GestureDetector(
                    child: DynamicItem(
                      data: _data[index],
                    ),
                    onTap: () {
                      onItemClick(_data[index]);
                    },
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

  void onItemClick(data) {
    Router.push(context, Router.dynamicDetailsPage, data);
  }
}
