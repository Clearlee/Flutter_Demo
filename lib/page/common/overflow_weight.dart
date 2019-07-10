import 'package:flutter/material.dart';

class OverFlowWeight extends StatefulWidget {

  OverFlowWeight({Key key, this.datas}) : super(key: key);

  List<String> datas;

  @override
  OverFlowWeightState createState() {
    return OverFlowWeightState(datas);
  }
}

class OverFlowWeightState extends State<OverFlowWeight> {

  List<String> datas;

  List<Positioned> postionDatas = [];

  OverFlowWeightState(this.datas);

  double right = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < datas.length; i++) {
      postionDatas.add(Positioned(
        right: right,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(180)),
              image: DecorationImage(
                  image: NetworkImage(datas[i]), fit: BoxFit.cover)),
        ),
      ));
      right = right + 14;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: datas.length * 24.0 - (datas.length - 1) * 10.0,
      child: Stack(
        children: postionDatas,
      ),
    );
  }
}
