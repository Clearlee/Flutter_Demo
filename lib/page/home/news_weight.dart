import 'package:flutter/material.dart';

class NewsWeight extends StatefulWidget {
  final String content;

  NewsWeight({Key key, this.content}) : super(key: key);

  @override
  _NewsWeightState createState() {
    // TODO: implement createState
    return _NewsWeightState(content);
  }
}

class _NewsWeightState extends State<NewsWeight> {
  final String content;

  _NewsWeightState(this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(content),
    );
  }
}
