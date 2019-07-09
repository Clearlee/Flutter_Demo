import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DynamicData.dart';
import 'package:flutter_app/page/common/DyanamicItem.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NewsWeight extends StatefulWidget {
  final String content;

  NewsWeight({Key key, this.content}) : super(key: key);

  @override
  _NewsWeightState createState() {
    // TODO: implement createState
    return _NewsWeightState(content);
  }
}

class _NewsWeightState extends State<NewsWeight> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  final String content;

  _NewsWeightState(this.content);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Builder(builder: (context) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      ((BuildContext context, int index) {
                return DynamicItem(
                  data: _data[index],
                );
              }), childCount: _data.length))
            ],
          );
        }));
  }
}
