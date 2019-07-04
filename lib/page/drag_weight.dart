import 'package:flutter/material.dart';

class DragWeight extends StatefulWidget {
  @override
  DragWeightState createState() {
    // TODO: implement createState
    return DragWeightState();
  }
}

class DragWeightState extends State<DragWeight> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              left: _left,
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('拖我'),
                ),
                onPanDown: (e) {
                  print("用户手指按下：${e.globalPosition}");
                },
                onPanUpdate: (e) {
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (e) {
                  print(e.velocity);
                },
              ))
        ],
      ),
    );
  }
}
