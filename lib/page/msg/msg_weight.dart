import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';

//消息页面
class MsgWeight extends StatefulWidget {
  @override
  _MsgWeightState createState() {
    // TODO: implement createState
    return _MsgWeightState();
  }
}

class _MsgWeightState extends State<MsgWeight> {
  List<MsgItem> headDatas;

  List<MsgItem> chatDatas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    headDatas ??= [
      MsgItem('订单消息', '你有1个新的订单已支付', assertImg: 'icon_order', unreadNumber: 3),
      MsgItem('官方消息', '审核通过，您的线路已经发布成功',
          assertImg: 'icon_official', unreadNumber: 8),
      MsgItem('互动消息', 'xxx评论了你的动态',
          assertImg: 'icon_interactive', unreadNumber: 2)
    ];

    chatDatas ??= [
      MsgItem('Nicole小姐姐', '您好！聊天内容聊天内容聊天内容…',
          usrImg:
              'https://link-e-pro.oss-cn-beijing.aliyuncs.com/24d30fdaa941eafd3bafaf992e93c9d9.png',
          unreadNumber: 3,
          time: '上午 10:78'),
      MsgItem('晓晓', '已发出[线路需求]',
          usrImg:
              'https://apioperate.btc123.com/api/user/noAuth/img/img?path=/usr/local/mokaimg/portrait/8286f44b6cae48a4a3eac4d232159be3.jpeg',
          unreadNumber: 3,
          time: '上午 10:78'),
      MsgItem('名字', '[线路需求]已收到',
          usrImg:
              'https://apioperate.btc123.com/api/user/noAuth/img/img?path=/usr/local/mokaimg/portrait/ce8d728531614590943cf1570f66e0f6.jpg',
          unreadNumber: 3,
          time: '上午 10:78'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '消息',
                    style: TextStyle(fontSize: 18, color: Color(0xFF222222)),
                  ),
                ),
                Align(
                  alignment: Alignment(1, 0),
                  child: Text(
                    '我的关注',
                    style: TextStyle(fontSize: 16, color: Color(0xFF222222)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              if (index <= 2) {
                return MsgItemWidget(msgItem: headDatas[index]);
              } else {
                return MsgItemWidget(msgItem: chatDatas[index - 3]);
              }
            },
            itemCount: 6,
          ))
        ],
      ),
    );
  }
}

class MsgItem {
  String title;
  String subTitle;
  String assertImg;
  String usrImg;
  int unreadNumber;
  String time;

  MsgItem(this.title, this.subTitle,
      {this.assertImg, this.usrImg, this.unreadNumber, this.time});
}

class MsgItemWidget extends StatelessWidget {
  final MsgItem msgItem;

  MsgItemWidget({Key key, this.msgItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFEEEEEE)))),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 44,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: _leftImg(),
                  bottom: 0,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 16,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFFF3B30),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(360))),
                    child: Text(
                      msgItem.unreadNumber.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    msgItem.title,
                    style: TextStyle(fontSize: 16, color: Color(0xFF000000)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                  ),
                  Text(
                    msgItem.subTitle,
                    style: TextStyle(fontSize: 14, color: Color(0xFFAEAEAE)),
                  ),
                ],
              ),
            ),
          ),
          _rightWidget(),
        ],
      ),
    );
  }

  _rightWidget() {
    if (msgItem.time != null) {
      return Container(
        height: 40,
        alignment: Alignment.topRight,
        child: Text(
          msgItem.time,
          style: TextStyle(fontSize: 12, color: Color(0xFFAEAEAE)),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Image.asset(
          Constant.getAssetImg('icon_next'),
          width: 8,
          height: 16,
        ),
      );
    }
  }

  _leftImg() {
    if (msgItem.assertImg != null) {
      return Image.asset(
        Constant.getAssetImg(msgItem.assertImg),
        width: 40,
        height: 40,
      );
    } else {
      return Container(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundImage: NetworkImage(msgItem.usrImg),
        ),
      );
    }
  }
}
