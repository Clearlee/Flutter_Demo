import 'package:flutter/material.dart';
import 'package:flutter_app/page/container_weight.dart';
import 'package:flutter_app/page/dynamic/dynamic_details_weight.dart';
import 'package:flutter_app/page/home/guide/guide_list_weight.dart';
import 'package:flutter_app/page/product/product_hall_page.dart';

class Router {
  static const homePage = 'app://';
  static const dynamicDetailsPage = 'app://dynamicDetailsPage';
  static const guideListPage = 'app://guideListPage';
  static const productHallPage = 'app://productHallPage';

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
      case guideListPage:
        return GuideListPage();
      case productHallPage:
        return ProductHallPage();
    }
    return null;
  }
}
