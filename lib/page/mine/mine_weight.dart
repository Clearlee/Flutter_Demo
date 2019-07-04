import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

class MineWeight extends StatefulWidget {
  @override
  _MineWeightState createState() {
    // TODO: implement createState
    return _MineWeightState();
  }
}

class _MineWeightState extends State<MineWeight> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image.asset(
            Constant.ASSETS_IMG + 'icon_mine_bg.png',
            width: ScreenUtil.screenW(context),
            height: 230,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(top: 64),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 21),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        Constant.ASSETS_IMG + 'icon_default_header.png',
                        width: 60,
                        height: 60,
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('未登录',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              alignment: Alignment.center,
                              width: 85,
                              height: 19,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Constant.ASSETS_IMG +
                                          'icon_no_certificate.png'))),
                              child: Text(
                                '导游认证',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      )),
                      Container(
                        alignment: Alignment.center,
                        width: 75,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Color(0x33FFFFFF),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(180),
                                bottomLeft: Radius.circular(180))),
                        child: Text(
                          '个人主页',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      VerticalItemWidget(
                          verticalItem: VerticalItem(title: '收藏', number: 0)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 35)),
                      VerticalItemWidget(
                          verticalItem: VerticalItem(title: '点赞', number: 0)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 35)),
                      VerticalItemWidget(
                          verticalItem: VerticalItem(title: '关注', number: 0)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 35)),
                      VerticalItemWidget(
                          verticalItem: VerticalItem(title: '粉丝', number: 0)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 13, bottom: 10),
                  margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      boxShadow: [
                        BoxShadow(color: Color(0x1A000000), blurRadius: 6.0)
                      ]),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      VerticalItemWidget(
                          verticalItem: VerticalItem(
                              title: '全部订单',
                              img: Constant.getAssetImg('icon_orders'))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: 1,
                          color: Color(0xFFF5F5F5),
                        ),
                      ),
                      VerticalItemWidget(
                          verticalItem: VerticalItem(
                              title: '待付款',
                              img: Constant.getAssetImg('icon_pay'))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: 1,
                          color: Color(0xFFF5F5F5),
                        ),
                      ),
                      VerticalItemWidget(
                          verticalItem: VerticalItem(
                              title: '未出行',
                              img: Constant.getAssetImg('icon_untrip'))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      HorizontalItemWidget(
                        horizontalItem: HorizontalItem(
                            title: '我的钱包',
                            img: 'icon_assets',
                            arrowImg: 'icon_next'),
                      ),
                      HorizontalItemWidget(
                        horizontalItem: HorizontalItem(
                            title: '我发布的',
                            img: 'icon_published',
                            arrowImg: 'icon_next'),
                      ),
                      Container(
                        height: 10,
                        color: Color(0xFFF6F6F6),
                      ),
                      HorizontalItemWidget(
                        horizontalItem:
                            HorizontalItem(title: '每日任务', img: 'icon_task'),
                      ),
                      TaskItemWidget(
                          taskItem: TaskItem(
                              '浏览行程', '浏览行程详情，每次可获得3兔币，多看多得！', 3, '做任务')),
                      TaskItemWidget(
                          taskItem: TaskItem(
                              '高额分享',
                              '分享行程或导游名片，并被好友浏览，最高可赚20兔币/次！上不封顶，该收益每日0点结算到账',
                              10,
                              '做任务')),
                      TaskItemWidget(
                          taskItem: TaskItem('浏览行程',
                              '成功发布动态，每次可获得10兔币，多发多得，分享旅行体验！', 10, '去完成')),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VerticalItem {
  int number;
  String title;
  String img;

  VerticalItem({@required this.title, this.img, this.number});
}

class VerticalItemWidget extends StatelessWidget {
  final VerticalItem verticalItem;

  VerticalItemWidget({Key key, @required this.verticalItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _topWeight(),
        Text(
          verticalItem.title,
          style: TextStyle(
              color: verticalItem.number == null
                  ? Color(0xFF222222)
                  : Colors.white),
        )
      ],
    );
  }

  _topWeight() {
    if (verticalItem.number != null) {
      return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(verticalItem.number.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18)),
      );
    } else {
      if (verticalItem.img != null)
        return Image.asset(verticalItem.img, width: 36, height: 36);
    }
  }
}

class HorizontalItem {
  String arrowImg;
  String title;
  String img;

  HorizontalItem({@required this.title, @required this.img, this.arrowImg});
}

class HorizontalItemWidget extends StatelessWidget {
  final HorizontalItem horizontalItem;

  HorizontalItemWidget({Key key, @required this.horizontalItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 21, right: 16),
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 0.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Constant.getAssetImg(horizontalItem.img),
            width: 20,
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                horizontalItem.title,
                style: TextStyle(color: Color(0xFF333333), fontSize: 17),
              ),
            ),
          ),
          Offstage(
            offstage: horizontalItem.arrowImg == null,
            child: Image.asset(
              Constant.getAssetImg(horizontalItem.arrowImg),
              width: 8,
              height: 14,
            ),
          )
        ],
      ),
    );
  }
}

class TaskItem {
  String taskName;
  String title;
  String content;
  int award;

  TaskItem(this.title, this.content, this.award, this.taskName);
}

class TaskItemWidget extends StatelessWidget {
  final TaskItem taskItem;

  TaskItemWidget({Key key, @required this.taskItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 21, right: 16),
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 0.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      taskItem.title,
                      style: TextStyle(color: Color(0xFF333333), fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        '+${taskItem.award}tb',
                        style:
                            TextStyle(color: Color(0xFFFF6226), fontSize: 16),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 4,
                ),
                Text(
                  taskItem.content,
                  style: TextStyle(color: Color(0xFF999999), fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 19),
            alignment: Alignment.center,
            width: 63,
            height: 27,
            decoration: BoxDecoration(
                color: Color(0xFFFF6226),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(180), right: Radius.circular(180))),
            child: Text(
              taskItem.taskName,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
