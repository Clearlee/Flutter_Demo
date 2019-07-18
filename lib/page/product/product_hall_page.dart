import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/product/product_list_weight.dart';
import 'package:flutter_app/page/product/select_pop_weight.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

class ProductHallPage extends StatefulWidget {
  @override
  ProductHallPageState createState() => ProductHallPageState();
}

class ProductHallPageState extends State<ProductHallPage>
    with SingleTickerProviderStateMixin {
  var _tabs = ['自然风光', '名胜古迹', '城市风光', '动植物园', '温泉酒店', '城市风光'];

  List<String> leftDatas = [
    '1-3天',
    '3-7天',
    '7-10天',
    '10天以上',
  ];

  List<String> centerDatas = [
    '一个人',
    '和伴侣',
    '和孩子',
    '和家人',
    '和朋友',
    '和伴侣',
    '和同学',
    '其他',
  ];

  List<String> rightDatas = [
    '1000-3000',
    '3001-5000',
    '5001以上',
  ];

  TabController _tabController;

  OverlayEntry _overlayEntry;

  GlobalKey leftKey = GlobalKey();
  GlobalKey centerKey = GlobalKey();
  GlobalKey rightKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController =
        new TabController(length: _tabs.length, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          top: false,
          left: false,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 16, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset(
                            Constant.getAssetImg('ic_arrow_back'),
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 24),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(180),
                                    right: Radius.circular(180)),
                                border: Border.all(
                                    color: Color(0xFFDDDDDD), width: 0.5)),
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
                                        hintStyle: TextStyle(
                                            color: Color(0xFF999999))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFEEEEEE), width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          key: leftKey,
                          onTap: () => _showPop(Position.left),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '天数',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 14),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Image.asset(
                                  Constant.getAssetImg('icon_down'),
                                  width: 8,
                                  height: 5,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 62),
                        ),
                        GestureDetector(
                          key: centerKey,
                          onTap: () => _showPop(Position.center),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '人物',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 14),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Image.asset(
                                  Constant.getAssetImg('icon_down'),
                                  width: 8,
                                  height: 5,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 62),
                        ),
                        GestureDetector(
                          key: rightKey,
                          onTap: () => _showPop(Position.right),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '价格',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 14),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Image.asset(
                                  Constant.getAssetImg('icon_down'),
                                  width: 8,
                                  height: 5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 52,
                    child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
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
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: _tabs.map((item) {
                          return ProductListWeight();
                        }).toList()),
                  )
                ],
              )
            ],
          )),
    );
  }

  _showPop(Position position) {
    switch (position) {
      case Position.left:
        _showRenderPop(leftKey, leftDatas, Position.left);
        break;
      case Position.center:
        _showRenderPop(centerKey, centerDatas, Position.center);
        break;
      case Position.right:
        _showRenderPop(rightKey, rightDatas, Position.right);
        break;
    }
  }

  _showRenderPop(GlobalKey globalKey, List<String> datas, Position position) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);

    double left, top;

    switch (position) {
      case Position.left:
        left = offset.dx - 10;
        break;
      case Position.center:
        left = offset.dx - 74;
        break;
      case Position.right:
        left = offset.dx - 140;
        break;
    }

    top = offset.dy + 20;

    _overlayEntry = new OverlayEntry(
        builder: (context) => Stack(
              children: <Widget>[
                //嵌套一层用于点击空白处消失
                GestureDetector(
                  onTap: () => _overlayEntry.remove(),
                  child: Container(
                    color: Colors.transparent,
                    width: ScreenUtil.screenW(context),
                    height: ScreenUtil.screenH(context),
                  ),
                ),
                Positioned(
                    left: left,
                    top: top,
                    child: SelectPopWeight(datas, position))
              ],
            ));
    Overlay.of(context).insert(_overlayEntry);
  }
}
