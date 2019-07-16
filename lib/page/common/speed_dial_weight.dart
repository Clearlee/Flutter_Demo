import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/common/pic_swiper.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

import 'circle_image.dart';

class SpeedDialWeight extends StatelessWidget {
  List<String> urls;
  List<ImgWeight> _imgs = [];
  double width, height;

  SpeedDialWeight(this.urls);

  @override
  Widget build(BuildContext context) {
    if (urls.length == 1) {
      width = ScreenUtil.screenW(context) - 32;
      height = 190.0;
    } else if (urls.length == 2 || urls.length == 4) {
      width = (ScreenUtil.screenW(context) - 10 - 32) / 2;
      height = width;
    } else {
      width = (ScreenUtil.screenW(context) - 20 - 32) / 3;
      height = width;
    }

    for (var i = 0; i < urls.length; i++) {
      _imgs.add(ImgWeight(
        index: i,
        url: urls[i],
        width: width,
        height: height,
        urls: urls,
      ));
    }

    // TODO: implement build
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _imgs,
    );
  }
}

class ImgWeight extends StatelessWidget {
  final String url;
  final int index;
  final double width;
  final double height;
  List<String> urls;

  ImgWeight(
      {@required this.url,
      this.index,
      this.width,
      this.height,
      this.urls,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        child: CircleImage(
          url: url,
          width: width,
          height: height,
          shape: BoxShape.rectangle,
          placeHolder: 'iamge_placeholder',
        ),
      ),
      onTap: () => _tap(context, index),
    );
  }

  _tap(BuildContext context, int index) {
    print(index);
    var page = PicSwiper(
        index,
        urls.map((url) {
          return PicSwiperItem(url);
        }).toList());
    Navigator.push(
        context,
        Platform.isAndroid
            ? TransparentMaterialPageRoute(builder: (_) {
                return page;
              })
            : TransparentCupertinoPageRoute(builder: (_) {
                return page;
              }));
  }
}
