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
      home: ContainerPage(),
//      routes: {
//        'login_page': (context) => LoginPage(),
//        'home_page': (context) => HomeWeight(),
//        'drag_page': (context) => DragWeight(),
//        'animate_page': (context) => AnimateWeight(),
//      },
    );
  }
}


