import 'package:flutter/material.dart';
import 'package:flutter_app/bean/product_data.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/page/common/circle_image.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

class ProductListWeight extends StatefulWidget {
  @override
  ProductListWeightState createState() => ProductListWeightState();
}

class ProductListWeightState extends State<ProductListWeight> {
  List<ProductData> _productDatas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 9; i++) {
      _productDatas.add(ProductData(
          'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b',
          '饶雪漫1',
          '2 周前',
          '甘肃美女数不胜数，不看不相信，看了你迷醉。甘肃第一美女果然在甘南 “中国小西藏、甘肃后花园”是她的美誉，草原上牛羊是她衣服上最…',
          5,
          12.5,
          true,
          productImg:
              'https://ruyi-resource.oss-cn-hangzhou.aliyuncs.com/ruyi/prod/7d4d307da5524840810834c714a7295b'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        itemCount: _productDatas.length,
        itemBuilder: (context, index) => ProductListItem(_productDatas[index]));
  }
}

class ProductListItem extends StatelessWidget {
  ProductData _productData;

  ProductListItem(this._productData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFEEEEEE)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CircleImage(
                    url: _productData.userHead,
                    width: 40,
                    height: 40,
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _productData.userName,
                      style: TextStyle(color: Color(0xFF222222), fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text(
                      _productData.time,
                      style: TextStyle(color: Color(0xFFAEAEAE), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 60,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6226),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(180), right: Radius.circular(180)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(Constant.getAssetImg('icon_follow'),
                          width: 10, height: 10),
                    ),
                    Text(
                      _productData.ifFollow ? '关注' : '已关注',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 190,
              child: Stack(
                children: <Widget>[
                  CircleImage(
                    url: _productData.productImg,
                    height: 190,
                    width: ScreenUtil.screenW(context) - 32,
                    shape: BoxShape.rectangle,
                    placeHolder: 'iamge_placeholder',
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      height: 25,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0x99000000),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(180),
                              right: Radius.circular(180))),
                      child: Text(
                        '${_productData.days}天游',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFFF2B64), Color(0xFFFF6226)]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: '参考¥',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          TextSpan(
                              text: '${_productData.price}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          TextSpan(
                              text: '/人',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ]),
                      ),
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.only(top: 9),
              child: Text(
                _productData.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF222222), fontSize: 16, height: 1.5),
              )),
        ],
      ),
    );
    ;
  }
}
