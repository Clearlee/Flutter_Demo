import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/publish/publish_weight.dart';

import 'home/home_weight.dart';
import 'mine/mine_weight.dart';
import 'msg/msg_weight.dart';

//首页
class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() {
    // TODO: implement createState
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {
  final items = [
    _Item('首页', Constant.ASSETS_IMG + 'ic_tab_home_active.png',
        Constant.ASSETS_IMG + 'ic_tab_home_normal.png'),
    _Item('发布', Constant.ASSETS_IMG + 'ic_tab_publish_active.png',
        Constant.ASSETS_IMG + 'ic_tab_publish_normal.png'),
    _Item('消息', Constant.ASSETS_IMG + 'ic_tab_msg_active.png',
        Constant.ASSETS_IMG + 'ic_tab_msg_normal.png'),
    _Item('我的', Constant.ASSETS_IMG + 'ic_tab_mine_active.png',
        Constant.ASSETS_IMG + 'ic_tab_mine_normal.png')
  ];

  List<BottomNavigationBarItem> bottomList;

  List<Widget> pages;

  int _selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bottomList ??= items
        .map((item) => BottomNavigationBarItem(
              title: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  item.text,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              icon: Image.asset(
                item.defalutImg,
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                item.activeImg,
                width: 20,
                height: 20,
              ),
            ))
        .toList();

    pages ??= [HomeWeight(), PublishWeight(), MsgWeight(), MineWeight()];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          _getPageByIndex(0),
          _getPageByIndex(1),
          _getPageByIndex(2),
          _getPageByIndex(3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: bottomList,
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 20,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFF6226),
        unselectedItemColor: Color(0xFF999999),
      ),
    );
  }

  Widget _getPageByIndex(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }
}

class _Item {
  String defalutImg;
  String activeImg;
  String text;

  _Item(this.text, this.activeImg, this.defalutImg);
}
