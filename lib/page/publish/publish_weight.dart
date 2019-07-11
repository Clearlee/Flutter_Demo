import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/util/EventBus.dart';
import 'package:flutter_app/util/ScreenUtil.dart';
import 'package:image_picker/image_picker.dart';

class PublishWeight extends StatefulWidget {
  @override
  _PublishWeightState createState() {
    // TODO: implement createState
    return _PublishWeightState();
  }
}

class _PublishWeightState extends State<PublishWeight> {

  List<ImgWeight> _imgs = [
    ImgWeight(
      path: 'icon_add_photo',
      index: 100,
    )
  ];

  List<String> _tags;

  bool _publishButtonEnable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tags ??= [
      '标签1',
      '标签2',
      '标签3',
      '标签4',
      '标签5',
      '标签6',
      '标签1',
      '标签2',
      '标签3',
      '标签4',
      '标签5',
      '标签6'
    ];

    eventBus
        .on<EventActions>()
        .listen((EventActions data) => _changeImgData(data));
  }

  _changeImgData(EventActions data) {
    if (data.action == EventActions.EVENT_ACTION_NEW_FILE_ARRIVED &&
        data.args != null &&
        data.args is File) {
      File file = data.args;
      setState(() {
        _imgs.insert(
            0,
            ImgWeight(
              path: file.path,
            ));
        if (_imgs.length == 10) {
          _imgs.removeLast();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                Constant.getAssetImg('ic_arrow_back'),
                width: 20,
                height: 20,
              ),
              Container(
                width: 60,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: _publishButtonEnable
                        ? Color(0xFFFF6226)
                        : Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(180),
                        right: Radius.circular(180))),
                child: Text(
                  '发布',
                  style: TextStyle(
                      color: _publishButtonEnable
                          ? Colors.white
                          : Color(0xFF999999),
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26, vertical: 11),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                        hintText: '说点什么吧…', border: InputBorder.none),
                    onChanged: _textChange,
                  ),
                ),
                //九宫格
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _imgs,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color(0xFFEEEEEE), width: 0.5))),
                  padding: EdgeInsets.only(left: 28),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 14, bottom: 14, right: 16),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFFEEEEEE), width: 0.5))),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              Constant.getAssetImg('icon_location'),
                              width: 20,
                              height: 20,
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                '兰州市黄河大桥风景区',
                                style: TextStyle(
                                    color: Color(0xFF222222), fontSize: 16),
                              ),
                            )),
                            Image.asset(
                              Constant.getAssetImg('icon_next'),
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 85,
                          padding:
                              EdgeInsets.only(top: 14, bottom: 14, right: 16),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFFEEEEEE), width: 0.5),
                                  top: BorderSide(
                                      color: Color(0xFFEEEEEE), width: 0.5))),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    Constant.getAssetImg('icon_label'),
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      '选择标签',
                                      style: TextStyle(
                                          color: Color(0xFF222222),
                                          fontSize: 16),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '加标签可以让更多人看到哦',
                                        style: TextStyle(
                                            color: Color(0xFFCCCCCC),
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    Constant.getAssetImg('icon_next'),
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      margin: EdgeInsets.only(right: 5),
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFFF0EB),
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(180),
                                              right: Radius.circular(180))),
                                      child: Text(
                                        _tags[index],
                                        style: TextStyle(
                                            color: Color(0xFFFF6226),
                                            fontSize: 12),
                                      ),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _tags.length,
                                  padding: EdgeInsets.only(top: 16),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _textChange(String value) {
    setState(() {
      _publishButtonEnable = value.length > 0 ? true : false;
    });
  }
}

class ImgWeight extends StatelessWidget {
  final String path;
  int index = 0;

  ImgWeight({@required this.path, this.index, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        width: (ScreenUtil.screenW(context) - 20 - 56) / 3,
        height: (ScreenUtil.screenW(context) - 20 - 56) / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            image: DecorationImage(
                image: path == 'icon_add_photo'
                    ? AssetImage(Constant.getAssetImg('icon_add_photo'))
                    : FileImage(File(path)),
                fit: BoxFit.cover)),
      ),
      onTap: () => _tap(index),
    );
  }

  _tap(int index) {
    if (index == 100) {
      _openGallery();
    }
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    eventBus.fire(
        EventActions(EventActions.EVENT_ACTION_NEW_FILE_ARRIVED, args: image));
  }
}
