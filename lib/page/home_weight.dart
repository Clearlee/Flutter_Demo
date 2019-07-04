import 'package:flutter/material.dart';
import 'package:flutter_app/page/login_weight.dart';

import 'listview_page.dart';

class HomeWeight extends StatefulWidget {
  @override
  HomeWeightState createState() {
    // TODO: implement createState
    return HomeWeightState();
  }
}

class HomeWeightState extends State<HomeWeight>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int index = 1;

  List tabs = ["新闻", "历史", "图片"];

  void _onItemTap(int value) {
    setState(() {
      index = value;
    });
  }

  void _onFloatButtonPress() {
//    Navigator.push( context,
//        new MaterialPageRoute(builder: (context) {
//          return new LoginPage();
//        }));
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ListViewPage();
      }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: tabController,
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
        controller: tabController,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home)),
            SizedBox(),
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.add),
        onPressed: _onFloatButtonPress,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text('business')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text('school')),
//        ],
//        fixedColor: Colors.blue,
//        currentIndex: index,
//        onTap: _onItemTap,
//      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeLeft: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/about_logo_icon.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
