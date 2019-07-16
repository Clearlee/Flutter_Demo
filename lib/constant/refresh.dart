import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Refresh {
  static headerList(GlobalKey<RefreshHeaderState> _headerKeyList) {
    return ClassicsHeader(
      key: _headerKeyList,
      refreshText: "pullToRefresh",
      refreshReadyText: "releaseToRefresh",
      refreshingText: "refreshing",
      refreshedText: "refreshed",
      moreInfo: "updateAt",
      bgColor: Colors.transparent,
      textColor: Colors.black,
    );
  }

  static footerList(GlobalKey<RefreshFooterState> _footerKeyList) {
    return ClassicsFooter(
      key: _footerKeyList,
      loadHeight: 50.0,
      loadText: "pushToLoad",
      loadReadyText: "releaseToLoad",
      loadingText: "loading",
      loadedText: "loaded",
      noMoreText: "noMore",
      moreInfo: "updateAt",
      bgColor: Colors.transparent,
      textColor: Colors.black,
    );
  }
}
