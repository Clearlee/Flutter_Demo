import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  void _back() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.only(bottom: 230),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _back();
                  },
                  child: Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('images/ic_arrow_back.png'),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Text(
                      '登录',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
                Text('注册')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Image(
              image: AssetImage('images/icon_login_logo.png'),
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text('壹程'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.0, left: 26.0, right: 26.0),
            child: Column(
              children: <Widget>[
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(180),
                            right: Radius.circular(180)),
                        border:
                            Border.all(width: 1.0, color: Color(0xffDDDDDD))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/icon_tel.png'),
                            width: 13,
                            height: 16,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '请输入手机号',
                                      border: InputBorder.none,
                                      hintStyle:
                                          TextStyle(color: Color(0xFFCCCCCC))),
                                )),
                          )
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(180),
                            right: Radius.circular(180)),
                        border:
                            Border.all(width: 1.0, color: Color(0xffDDDDDD))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/icon_recaptcha.png'),
                            width: 13,
                            height: 16,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '请输入验证码',
                                      border: InputBorder.none,
                                      hintStyle:
                                          TextStyle(color: Color(0xFFCCCCCC))),
                                )),
                          ),
                          Text(
                            '获取验证码',
                            style: TextStyle(color: Color(0xFFFF6226)),
                          )
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(180),
                          right: Radius.circular(180)),
//                      color: Color(0xFFF6F6F6),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFF2B64), Color(0xFFFF6226)])),
                  child: SizedBox(
                    child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          '登录',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    width: double.infinity,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FlatButton(child: Text('手机验证登录')),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Color(0xFFAEAEAE), width: 1))),
                      ),
                      FlatButton(child: Text('找回密码'))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}


