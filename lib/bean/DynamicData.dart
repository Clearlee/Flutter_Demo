class DynamicData {
  String img;
  String userName;
  String time;
  bool ifFollow;
  String userHead;
  String content;
  String location;
  bool ifLike;
  int likeNum;

  List<String> urlDatas;

  List<String> imgsDatas;

  DynamicData(this.userHead, this.userName, this.time, this.content,
      this.location, this.likeNum, this.ifFollow, this.ifLike,
      {this.urlDatas,this.imgsDatas});
}
