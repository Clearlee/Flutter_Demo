import 'package:flutter/material.dart';
import 'package:flutter_app/page/home/news_weight.dart';

class NestedScrollViewWidget extends StatefulWidget {
  @override
  NestedScrollViewWidgetState createState() {
    // TODO: implement createState
    return NestedScrollViewWidgetState();
  }
}

class NestedScrollViewWidgetState extends State<NestedScrollViewWidget>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<NestedScrollViewWidget> {
  var _tabs = ['关注', '全部', '快讯'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  backgroundColor: Color(0xfff1f1f1),
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                      child: Container(
                        color: Colors.white,
                      ),
                      preferredSize: Size.fromHeight(200)),
                  flexibleSpace: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                              ))
                          .toList()),
                )),
              ),
            ];
          },
          body: TabBarView(
              children: _tabs.map((item) {
            return NewsWeight(content: item);
          }).toList()),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
