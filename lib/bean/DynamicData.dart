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

  DynamicData(this.userHead, this.userName, this.time, this.content,
      this.location, this.img, this.likeNum, this.ifFollow, this.ifLike,
      {this.urlDatas});
}
