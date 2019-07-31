import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/common/extend_webview_scaffold.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      left: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    margin: EdgeInsets.only(top: 30),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Image.asset(
                                Constant.getAssetImg('ic_arrow_back'),
                                width: 20,
                                height: 20,
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                            GestureDetector(
                              child: Image.asset(
                                Constant.getAssetImg('icon_share'),
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            '行程详情',
                            style: TextStyle(
                                color: Color(0xFF333333), fontSize: 18),
                          ),
                        )
                      ],
                    )),
                Expanded(
                  child: ExtendWebviewScaffold(
                    url: 'http://47.95.234.176/travel/2',
                    withZoom: false,
                    withLocalStorage: true,
                    withJavascript: true,
                    scrollBar: false,
                    useWideViewPort: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: Color(0xFFF1F1F1), width: 1)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFF1F1F1),
                            offset: Offset(5, 5),
                            blurRadius: 8)
                      ]),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 50,
                        alignment: Alignment.center,
                        child: Image.asset(
                          Constant.getAssetImg('icon_collect'),
                          height: 40,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        alignment: Alignment.center,
                        child: Image.asset(
                          Constant.getAssetImg('icon_product_like'),
                          height: 40,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Color(0xFFFF2B64),
                            Color(0xFFFF6226)
                          ])),
                          child: Text(
                            '和TA定制行程',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
