import 'package:flutter/material.dart';
import 'package:flutter_app/page/container_weight.dart';
import 'package:flutter_app/page/dynamic/dynamic_details_weight.dart';

class Router {
  static const homePage = 'app://';
  static const dynamicDetailsPage = 'app://dynamicDetailsPage';

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }

  Widget _getPage(String url, params) {
    switch (url) {
      case homePage:
        return ContainerPage();
      case dynamicDetailsPage:
        return DynamicDetailPage(
          dynamicData: params,
        );
    }
    return null;
  }
}
