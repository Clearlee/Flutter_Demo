import 'package:flutter/material.dart';

class AnimateWeight extends StatefulWidget {
  @override
  AnimateWeightState createState() {
    // TODO: implement createState
    return AnimateWeightState();
  }
}

class AnimateWeightState extends State<AnimateWeight>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = new CurvedAnimation(
        parent: _animationController, curve: Curves.bounceIn);
    _animation = new Tween(begin: 0.0, end: 300.0).animate(_animation);
//      ..addListener(() {
//        setState(() {});
//      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



/*    return Scaffold(
//      body: Center(
//        child: Image.asset('images/about_logo_icon.png',
//            width: _animation.value, height: _animation.value),
//      ),
      body: Center(
        child: AnimatedImage(
          animation: _animation,
        ),
      ),
    );*/

    /*return AnimatedBuilder(
        animation: _animation,
        child: Image.asset('images/about_logo_icon.png'),
        builder: (context, child) {
          return Center(
            child: Container(
              width: _animation.value,
              height: _animation.value,
              child: child,
            ),
          );
        });*/

    return GrowTransition(
      child: Image.asset('images/about_logo_icon.png'),
      animation: _animation,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();

    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    // TODO: implement build
    return Center(
        child: Image.asset('images/about_logo_icon.png',
            width: animation.value, height: animation.value));
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  Animation animation;
  Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
