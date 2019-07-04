import 'package:flutter/material.dart';

class MutilAnimateWeight extends StatefulWidget {
  @override
  AnimateWeightState createState() {
    // TODO: implement createState
    return AnimateWeightState();
  }
}

class AnimateWeightState extends State<MutilAnimateWeight>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: playAnimate,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.5)),
              color: Colors.black.withOpacity(0.1)),
          child: StaggerAnimation(
            controller: _animationController,
          ),
        ),
      ),
    ));
  }

  Future<Null> playAnimate() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {}
  }
}

class StaggerAnimation extends StatelessWidget {
  AnimationController controller;

  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = new Tween(begin: 0.0, end: 300.0).animate(new CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    color = new ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    padding = new Tween(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: padding.value,
            alignment: Alignment.bottomCenter,
            child: Container(
              color: color.value,
              width: 300,
              height: height.value,
            ),
          );
        });
  }
}
