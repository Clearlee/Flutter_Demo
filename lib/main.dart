import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/animate_weight.dart';
import 'package:flutter_app/page/container_weight.dart';
import 'package:flutter_app/page/drag_weight.dart';
import 'package:flutter_app/page/home_weight.dart';
import 'package:flutter_app/page/login_weight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        backgroundColor: Colors.white
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: ContainerPage(),
      routes: {
        'new_page': (context) => NewRoute(),
        'counter_page': (context) => CounterWeight(),
        'checkbox_page': (context) => CheckboxPage(),
        'login_page': (context) => LoginPage(),
        'animate_page': (context) => AnimatePage(),
        'home_page': (context) => HomeWeight(),
        'drag_page': (context) => DragWeight(),
        'animate_page': (context) => AnimateWeight(),
      },
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _navigateNewPage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new ContainerPage();
    }));
//    Navigator.pushNamed(context, 'animate_page');
//    Navigator.push(context, CupertinoPageRoute(builder: (context) {
//      return MutilAnimateWeight();
//    }));
//    Navigator.push(
//        context,
//        PageRouteBuilder(
//            pageBuilder: (BuildContext context, Animation<double> animation,
//                Animation<double> secondaryAnimation) {
//              return FadeTransition(
//                child: DragWeight(),
//                opacity: animation,
//              );
//            },
//            transitionDuration: Duration(milliseconds: 500)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'hello'),
              TextSpan(
                  text: 'www.google.com', style: TextStyle(color: Colors.blue))
            ]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateNewPage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      backgroundColor: Colors.white,
    );
  }
}

class AnimatePage extends StatefulWidget {
  @override
  AnimatePageState createState() {
    // TODO: implement createState
    return AnimatePageState();
  }
}

class AnimatePageState extends State<AnimatePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('动画页面')),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text('hello flutter'),
                ),
              ),
              Text('你好')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('hello flutter'),
                  )),
              Text('你好')
            ],
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.center,
                    radius: .98),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),
            alignment: Alignment.center,
            child: Text("5.20",
                style: TextStyle(color: Colors.white, fontSize: 40.0)),
          )
        ],
      ),
    );
  }
}

class CheckboxPage extends StatefulWidget {
  @override
  CheckboxPageSate createState() {
    // TODO: implement createState
    return CheckboxPageSate();
  }
}

class CheckboxPageSate extends State<CheckboxPage> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  bool hasFoucus = false;
  TextEditingController _controller = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initController();
  }

  void _initController() {
    _controller.text = 'hello flutter';
    _controller.selection =
        new TextSelection(baseOffset: 2, extentOffset: _controller.text.length);

    focusNode2.addListener(() {
      setState(() {
        print('Clearlee 1111');
        hasFoucus = focusNode2.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Clearlee build');

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('CheckboxPage')),
        body: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    this.setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    this.setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                TextField(
                  autofocus: true,
                  focusNode: focusNode1,
                  decoration:
                      InputDecoration(hintText: '提示文本', labelText: '账号'),
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  cursorColor: Colors.red,
                ),
                Container(
                  child: TextField(
                    focusNode: focusNode2,
                    decoration: InputDecoration(
                        labelText: '密码', border: InputBorder.none),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: hasFoucus
                                  ? Colors.red[500]
                                  : Colors.grey[200],
                              width: 1.0))),
                ),
                RaisedButton(
                  child: Text('移动焦点'),
                  onPressed: () {
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('新页面'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('RaisedButton'),
                onPressed: () => {},
              ),
              FlatButton(
                child: Text('FlatButton'),
                onPressed: () => {},
              ),
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => {},
              ),
              FlatButton(
                child: Text('自定义按钮'),
                textColor: Colors.white,
                color: Colors.blue,
                splashColor: Colors.grey,
                colorBrightness: Brightness.dark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => {},
              ),
              Image(
                image: AssetImage('images/about_logo_icon.png'),
                width: 100,
                height: 100,
              ),
              Image(
                image: NetworkImage(
                    'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
                width: 100,
                height: 100,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
              ),
              Text(
                icons,
                style: TextStyle(
                    fontFamily: 'MaterialIcons',
                    fontSize: 24.0,
                    color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green)
                ],
              ),
            ],
          ),
        ));
  }
}

class CounterWeight extends StatefulWidget {
  const CounterWeight({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWeightState createState() => new _CounterWeightState();
}

class _CounterWeightState extends State<CounterWeight> {
  int _counter;
  bool active = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print('Clearlee initState');
  }

  void _handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Clearlee build');
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 42.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWeight oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('Clearlee didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('Clearlee deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Clearlee dispose');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('Clearlee reassemble');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Clearlee didChangeDependencies');
  }
}
