import 'package:flutter/material.dart';
import 'package:flutter_app/util/ScreenUtil.dart';

class SpeedDialWeight extends StatelessWidget {

  List<String> urls;
  List<ImgWeight> _imgs;
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

    _imgs ??= urls.map((url) {
      return ImgWeight(url: url, width: width, height: height);
    }).toList();

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

  ImgWeight({@required this.url, this.index, this.width, this.height, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      ),
      onTap: () => _tap(index),
    );
  }

  _tap(int index) {
    if (index == 100) {
      _openGallery();
    }
  }

  _openGallery() async {}
}
