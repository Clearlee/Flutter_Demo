class GuideItem {
  String guideHead;
  String guideName;
  bool ifFollow;
  int level;
  int fansCount;
  int focusCount;
  int likeCount;

  GuideItem(this.guideName, this.guideHead, this.fansCount, this.focusCount,
      this.likeCount, this.level, this.ifFollow);
}
